require 'pry'

module Scales
  def major
    {
      'C' => ['C', 'D', 'E', 'F', 'G', 'A', 'B', 'C'],
      'Db' => ['Db', 'Eb', 'F', 'Gb', 'Ab', 'Bb', 'C', 'Db'],
      'D' => ['D', 'E', 'F#', 'G', 'A', 'B', 'C#', 'D'],
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
