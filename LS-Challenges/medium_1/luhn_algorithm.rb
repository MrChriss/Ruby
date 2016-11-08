# checks if a number is valid per Luhn formula
# returns the checksum
# can create a valid number per Luhn formula
class Luhn
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def self.create(nmbr)
    luhn = Luhn.new(nmbr)

    (0..9).each do |n|
      check = (luhn.num.to_s.chars << n.to_s).join.to_i
      return check if Luhn.new(check).valid?
    end
  end

  def addends
    arr = num.to_s.chars.map(&:to_i)
    arr.map!.with_index { |n, i| i.even? ? n * 2 : n } if arr.size.even?
    arr.map!.with_index { |n, i| i.odd? ? n * 2 : n } if arr.size.odd?
    arr.map { |n| n > 9 ? n - 9 : n }
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    (checksum % 10).zero?
  end
end
