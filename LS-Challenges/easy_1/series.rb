class Series
  attr_accessor :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    raise ArgumentError if digits.size < length
    counter = 0
    new_arr = []

    while (length + counter) <= digits.size
      new_arr << digits.slice(counter...(length + counter)).split('').map(&:to_i)
      counter += 1
    end

    new_arr
  end
end
