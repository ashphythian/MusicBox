class ScaleBuilder
  attr_reader :root, :mode

  InvalidRootError = Class.new(StandardError)

  def initialize(root, mode)
    @root = root.upcase
    @mode = mode.downcase
  end

  def self.build
    new(root, mode).build
  end

  def build
    current_index = notes.index(convert_root)
    output = [notes[current_index]]

    chosen_scale.each do |interval|
      current_index = (current_index + interval) % 12
      output << notes[current_index]
    end

    output
  end

  private

  def convert_root
    if sharpened_root.include?(root)
      sharpened_root[root]
    elsif notes.include?(root)
      root
    else
      raise InvalidRootError, 'Not a valid root. For example C/C#/Db'
    end
  end

  def sharpened_root
    {
      'DB' => 'C#',
      'EB' => 'D#',
      'GB' => 'F#',
      'AB' => 'G#',
      'BB' => 'A#'
    }
  end

  def chosen_scale
    if major_terms.include?(mode)
      major_intervals
    elsif minor_terms.include?(mode)
      minor_intervals
    end
  end

  def notes
    ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
  end

  def major_intervals
    [2, 2, 1, 2, 2, 2, 1]
  end

  def minor_intervals
    [2, 1, 2, 2, 1, 2, 2]
  end

  def major_terms
    ['maj', 'major', 'ionian']
  end

  def minor_terms
    ['min', 'minor', 'aeolian']
  end
end
