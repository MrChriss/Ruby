# sums all the multiples up to (but not including) the specified limit
# if no argument is given, it assumes multiples to be 3, 5
class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(limit)
    result = []
    counter = 0

    @multiples.each do |num|
      loop do
        sum = num * (counter + 1)
        if sum < limit
          sum
          result << sum
          counter += 1
        else
          counter = 0
          break
        end
      end
    end

    result.uniq.inject(:+).nil? ? 0 : result.uniq.inject(:+)
  end

  def self.to(limit)
    new.to(limit)
  end
end
