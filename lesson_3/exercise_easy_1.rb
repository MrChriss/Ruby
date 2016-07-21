# Question 1
  # it would print
  # 1
  # 2
  # 2
  # 3

# Question 2
  # ! is used at the end of method names to indicate methods,
  # that "mutate the caller", are "destructive methods"
  # however, not all destructive methodst have ! at the end of their names

  # ? is used at the end of method names to indicate methods,
  # that return a boolean value
  # it can also be a terniary operator if folowed by ":"

  # != is a "does not equal" sign, it should be used when comparing values,
  # and expecting a returned boolean value

  # user_name = 'abc'
  # !user_name
  # => false (returns the opposite of variables boolean value)

  # words = [1, 2, 2, 3]
  # words.uniq!
  # => [1, 2, 3] (returns only unique values from the array)
  # words
  # => [1, 2, 3] (also mutates the caller, words is now changed)

  # ?a
  # => "a"
  # ?8
  # => "8"
  # ?!
  # => "!"
  # ?10
  # => syntax error, unexpected '?'
  # (it returns a string version of one character signs)

  # arr = [1, 2, 3, 4, 5]
  # arr.include?(5)
  # => true

  # user_name = 'abc'
  # !!user_name
  # => true (returns boolean value of a variable)

# Question 3
  # advice = "Few things in life are as important as house training your pet dinosaur."
  # advice.gsub!('important', 'urgent')

# Question 4
  # numbers = [1, 2, 3, 4, 5]
  # numbers.delete_at(1) --> deletes the value at index 1
  # numbers.delete(1) --> deletes all values 1 in the array

# Question 5
  num = 42

  if (10..100).include?(num)
    Kernel.puts("#{num} is between 10 and 100")
  else
    Kernel.puts("#{num} is not between 10 and 100")
  end

# Question 6
  famous_words = "seven years ago..."
  not_so_famous_ones = "Four score and "

  Kernel.puts("#{not_so_famous_ones}" + "#{famous_words}")
  not_so_famous_ones << famous_words
  Kernel.puts("#{not_so_famous_ones}")

# Question 7
  # 42

# Question 8
  flintstones = ["Fred", "Wilma"]
  flintstones << ["Barney", "Betty"]
  flintstones << ["BamBam", "Pebbles"]

  flintstones.flatten!

  Kernel.puts(flintstones)

# Question 9
  flintstones = { "Fred" => 0,
                  "Wilma" => 1,
                  "Barney" => 2,
                  "Betty" => 3,
                  "BamBam" => 4,
                  "Pebbles" => 5
                }
  flintstones.assoc("Barney")

# Question 10
  flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

  flintstones_hash = {}
  flintstones.each_with_index do |name, index|
    flintstones_hash[name] = index
  end
