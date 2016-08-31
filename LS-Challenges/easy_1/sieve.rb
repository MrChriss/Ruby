class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    (2..limit).select do |num|
      if (1..limit).to_a.map { |n| num % n == 0 }.count(true) == 2
        true
      end
    end
  end
end

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    (2..@limit).to_a.reject! do |num|
      (1..@limit).to_a.map { |n| num % n == 0 }.count(true) != 2
    end
  end
end
