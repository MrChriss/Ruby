#exercise n. 1
#it returns array x

#exercise n. 2
answer = ""

while answer != "STOP"
  puts "Input the password to stop the loop"
  answer = gets.chomp
  if answer == "STOP"
    puts "congratulations, you guessed it."
  end
end

#exercise n. 3
array = ["a", "b", "c", "d"]

array.each_with_index do |value, index|
  puts "Value: #{value}, index: #{index}"
end

#exercise n. 4
def to_zero(number)
  if number <= 0
    puts number
  else
    puts number
    to_zero(number-1)
  end
end

to_zero(66)
