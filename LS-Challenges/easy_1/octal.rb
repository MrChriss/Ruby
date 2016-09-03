class Octal
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def valid_octal?
    new_array = number.split('')

    if number.to_i == 0
      false
    elsif new_array.include?('9')
      false
    elsif new_array.include?('8')
      false
    else
      true
    end
  end

  def to_decimal
    counter = 0
    new_array = number.reverse.split('')

    while counter < new_array.size
      new_array[counter] = new_array[counter].to_i * (8**counter)
      counter += 1
    end

    valid_octal? ? new_array.inject(:+) : 0
  end
end
