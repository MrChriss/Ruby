#exercise n. 1
puts "Kristof " + "Crnivec"

#exercise n. 2
puts "number is 5321"
puts 5321 % 10 #ones
puts 5321 / 10 % 10 #tens
puts 5321 / 100 % 10 #hundreds
puts 5321 / 1000 % 10 #thousands

#exercise n. 3
movies_hsh = {
  some_film: 1975,
  some_other_film: 2004,
  yet_another_one: 2013,
  and_again: 2001,
  and_again_film: 1981
}
movies_hsh.each do |film, year|
  puts year
end

#exercise n. 4
movies_arr = [1975, 2004, 2013, 2001, 1981]
movies_arr.each do |year|
  puts year
end

#exercise n. 5
factorials = [5, 6, 7, 8]
add = 0
result = 1

factorials.each do |number|
  until number == add
    add += 1
    result *= add
  end
  puts result
end

#exercise n. 6
puts 3.33 * 7.21
puts 4.31 * 2.23
puts 7.89 * 6.321

#exercise n. 7
#there is a ) insted of } somewhere in the code, would check hashes
