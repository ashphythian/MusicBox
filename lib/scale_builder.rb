class ScaleBuilder
  attr_reader :root, :mode

  InvalidRootError = Class.new(StandardError)
  InvalidModeError = Class.new(StandardError)

  def initialize(root, mode)
    @root = root[0].upcase + root[1..-1]
    @mode = mode.downcase
  end

  def self.build(root, mode)
    new(root, mode).build
  end

  def build
    scale[0..-2].each_with_index.map do |note, index|
      if rotated_notes[index].include?(note)
        note
      else
        flats_and_sharps[note]
      end
    end << scale[-1]
  end

  def self.scale(root, mode)
    new(root, mode).scale
  end

  def scale
    @scale ||= generate_scale
  end

  def generate_scale
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
    if notes.include?(root)
      root
    else
      raise InvalidRootError, 'Not a valid root. For example C/C#/Db'
    end
  end

  def flats_and_sharps
    {
      'Db' => 'C#',
      'Eb' => 'D#',
      'Gb' => 'F#',
      'Ab' => 'G#',
      'Bb' => 'A#',
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
    else
      raise InvalidModeError, 'Not a valid mode. Please enter "maj/major/ioinan or min/minor/aeolian'
    end
  end

  def sharp?(note)
    note[1] == '#'
  end

  def flat?(note)
    note[1] == 'b'
  end

  def rotated_notes
    nested_notes.rotate(root_index)
  end

  def root_index
    nested_notes.index { |notes| notes.include?(root) }
  end

  def nested_notes
    [
      ['C', 'C#'],
      ['Db', 'D', 'D#'],
      ['Eb', 'E'],
      ['F', 'F#'],
      ['Gb', 'G', 'G#'],
      ['Ab', 'A', 'A#'],
      ['Bb', 'B']
    ]
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
