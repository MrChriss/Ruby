# calculates if a number is perfect, deficient, or abundant
class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0
    divisors_sum = (1...num).select do |n|
      (num % n).zero?
    end.inject(:+)
    if divisors_sum == num
      'perfect'
    elsif divisors_sum > num
      'abundant'
    else
      'deficient'
    end
  end
end
