#exercise n. 1
=begin
1. (32 * 4) >= 129  false
2. false != !true   false
3. true == 4        false
4. false == (847 == '874') true
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false -----> true
=end

#exercise n. 2
def caps(word)
  if word.length > 10
    return word.upcase
  else
    return word
  end
end
puts caps("aaaaaaaaa")
puts caps("aaaaaaaaaaaaaaaaaaaa")

#exercise n. 3
puts "input an integer between 0 and 100"
num = gets.chomp.to_i

case num
  when 0..50
    puts "#{num} is between 0 and 50"
  when 51..100
    puts "#{num} is between 51 and 100"
  else
    puts "#{num} is not whitin range"
end

#exercise n. 4
=begin
1. '4' == 4 ? puts("TRUE") : puts("FALSE")    false

2. x = 2                                      did you get it right
   if ((x * 3) / 2) == (4 + 4 - x - 3)
     puts "Did you get it right?"
   else
     puts "Did you?"
   end

3. y = 9                                      Alright now!
   x = 10
   if (x + 1) <= (y)
     puts "Alright."
   elsif (x + 1) >= (y)
     puts "Alright now!"
   elsif (y + 1) == x
     puts "ALRIGHT NOW!"
   else
     puts "Alrighty!"
   end
=end

#exercise n. 5
puts "input an integer between 0 and 100"
num_2 = gets.chomp.to_i

def some_method(number)
  case number
    when 0..50
      puts "#{number} is between 0 and 50"
    when 51..100
      puts "#{number} is between 51 and 100"
    else
      puts "#{number} is not whitin range"
  end
end

some_method(num_2)

#exercise n. 6
#forgot to add another 'end', for end of method block
