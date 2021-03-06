class Octal
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def valid_octal?
    number.split('').each do |num|
      return false unless %w(0 1 2 3 4 5 6 7).include? num
    end
  end

  def to_decimal
    counter = 0
    unit_array = number.reverse.split('')

    while counter < unit_array.size
      unit_array[counter] = unit_array[counter].to_i * (8**counter)
      counter += 1
    end

    valid_octal? ? unit_array.inject(:+) : 0
  end
end
