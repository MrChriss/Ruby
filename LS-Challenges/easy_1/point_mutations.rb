# calculates hamming's distance between two DNA sequences,
# disregards the exess characters of the longer sequence.
class DNA
  def initialize(seq)
    @sequence = seq.chars
  end

  def hamming_distance(seq)
    @sequence.zip(seq.chars).select do |pair|
      pair.first != pair.last unless pair.include? nil
    end.size
  end
end
