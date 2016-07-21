# Question 1
  10.times { |times| Kernel.puts (" " * times) + "The Flintstones Rock!" }

# Question 2
  statement = "The Flintstones Rock"
  hash = {}

  statement.each_char do |letter|
    if hash.has_key?(letter)
      hash[letter] += 1
    else
      hash[letter] = 1
    end
  end

  Kernel.puts(hash)

  # result = {}
  # letters = ('A'..'Z').to_a + ('a'..'z').to_a
  # letters.each do |letter|
  #   letter_frequency = statement.scan(letter).count
  #   result[letter] = letter_frequency if letter_frequency > 0
  # end

# Question 3
  Kernel.puts("the value of 40 + 2 is #{(40 + 2)}")
  Kernel.puts("the value of 40 + 2 is " + (40 + 2).to_s)

# Question 4
  # numbers = [1, 2, 3, 4]
  # numbers.each do |number|
  # p number
  # numbers.shift(1)
  # end

  # p the first element in array (1), .shift(1) removes and returns it
  # iteration continues at index 1, but since element whit value 1 was removed,
  # element with value 2 is at index 0, so p outputs 3, which is now at index 1
  # shift(1) now removes and returns value 2, iteration continues at index 2,
  # but there are no values at index 2 since array "numbers" now only contains
  # two elements

  # numbers = [1, 2, 3, 4]
  #   p number
  #   numbers.pop(1)
  # end

  # p the first element in array (1), and removes the last (4),
  # than p the second element (2) and removes the last (3)

# Question 5
  # def factors(number)
  # dividend = number
  #   divisors = []
  #   begin
  #     divisors << number / dividend if number % dividend == 0
  #     dividend -= 1
  #   end until dividend == 0
  #   divisors
  # end

  def factors(number)
    dividend = number
    divisors = []
    while number > 0 do
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end
    divisors
  end

  # the purpose of the number % dividend == 0
  # is to only add integers to divisors array

  # method returns the array of all intiger divisors of "number"

# Question 6
  # The difference is, that + concatenates two arrays and returns a new array
  # append << operator pushes value to the same array, and returns itself
  # the first implementation of this method will mutate the passed array
  # while the second will not. It will return a new array

# Question 7
  # add an aditional parameter limit and pass in limit's value (15)

# Question 8
  # words.split.map { |word| word.capitalize }.join(' ')
  # .split method splits words based on a delimiter,
  # and returns an array of words, .map method returns a new array of values
  # specified by the block,
  # which capitalises every element in returned words.split array
  # and than joins all elements with a space between them.

# Question 9
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }

  munsters.each do |_, value|
    case value["age"]
    when (0..17)
      value["age_group"] = "kid"
    when (18..64)
      value["age_group"] = "adult"
    else
      value["age_group"] = "senior"
    end
  end

  Kernel.puts(munsters)
