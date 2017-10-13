class ScaleBuilder
  attr_reader :root, :mode

  InvalidRootError = Class.new(StandardError)

  def initialize(root, mode)
    @root = root[0].upcase + root[1..-1]
    @mode = mode.downcase
  end

  def self.build(root, mode)
    new(root, mode).build
  end

  def build
    scale[0..-2].each_with_index.map do |note, index|
      if adjacent_notes(note, index)
        flattened_sharp[note]
      else
        note
      end
    end << scale[-1]
  end

  def self.scale(root, mode)
    new(root, mode).scale
  end

  def scale
    current_index = notes.index(convert_root)
    output = [notes[current_index]]

    chosen_scale.each do |interval|
      current_index = (current_index + interval) % 12
      output << notes[current_index]
    end

    output
  end

  private

  def adjacent_notes(note, index)
    (note[0] == scale[index + 1][0] || note[0] == scale[index - 1][0]) &&
      note.length == 2
  end

  def convert_root
    if sharpened_flat.include?(root)
      sharpened_flat[root]
    elsif notes.include?(root)
      root
    else
      raise InvalidRootError, 'Not a valid root. For example C/C#/Db'
    end
  end

  def sharpened_flat
    {
      'Db' => 'C#',
      'Eb' => 'D#',
      'Gb' => 'F#',
      'Ab' => 'G#',
      'Bb' => 'A#'
    }
  end

  def flattened_sharp
    {
      'C#' => 'Db',
      'D#' => 'Eb',
      'F#' => 'Gb',
      'G#' => 'Ab',
      'A#' => 'Bb'
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
