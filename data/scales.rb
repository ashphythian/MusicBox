require 'pry'

module Scales
  def major
    {
      'C' => ['C', 'D', 'E', 'F', 'G', 'A', 'B'],
      'Db' => ['Db', 'Eb', 'F', 'Gb', 'Ab', 'Bb', 'C'],
      'D' => ['D', 'E', 'Gb', 'G', 'A', 'B', 'Db'],
      'Eb' => [], 
      'E' => [],
      'F' => [],
      'F#' => [],
      'G' => [],
      'Ab' => [],
      'A' => [],
      'Bb' => [],
      'B' => [],
      'Cb' => []
    }
  end
  alias_method :ionian, :major

  def minor
    {
      'C' => [],
      'D' => [],
      'E' => [],
      'F' => [],
      'G' => [],
      'A' => [],
      'B' => []
    }

  end
  alias_method :aeolian, :minor

end

    {
      'C' => [],
      'Db' => [],
      'D' => [],
      'Eb' => [], 
      'E' => [],
      'F' => [],
      'F#' => [],
      'G' => [],
      'Ab' => [],
      'A' => [],
      'Bb' => [],
      'B' => [],
      'Cb' => []
    }
