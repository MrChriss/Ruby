# checks string if there is an anagram suplied by match instance method
# return only anagrams and not the original string. It is case insensitive.
class Anagram
  def initialize(anagram)
    @anagram = anagram
  end

  def match(arry)
    result = arry.select do |word|
      word if word.downcase.chars.sort.join == @anagram.downcase.chars.sort.join
    end

    result.select { |word| word.casecmp(@anagram).nonzero? }
  end
end
