array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = []

#exercise n. 1
array.each do |element|
  puts element
end

#exercise n. 2
array.each do |element|
  if element > 5
    puts element
  end
end

#exercise n. 3
array.select do |element|
  if element % 2 == 1
    new_array << element
  end
end
puts new_array

#exercise n. 4
array.push(11)
array.unshift(0)
puts array

#exercise n. 5
array.pop
array.push(3)
puts array

#exercise n. 6
array.uniq!
puts array

#exercise n. 7
#values in hash can be named with strings, symbols, variable names...
#values in an array are referenced by postition in array

#exercise n. 8
=begin
old_hash = {
  value_2 => "something else"
  value => "thisandthat",
}
=end

new_hash = {
  value: "thisandthat",
  value_2: "something else"
}

#exercise n. 9
h = {
  a: 1,
  b: 2,
  c: 3,
  d: 4
}

puts "value of key \"b\" in hash \"h\" is #{h[:b]}"
h[:e] = 5

puts h

h.select do |key, value|
  if value < 3.5
    h.delete(key)
  end
end

puts h

#exercise n. 10
#Can hash values be arrays? Can you have an array of hashes?
#Yes to both
hash_with_arr = {
 nums: [1, 2, 3],
 letters: ["a", "b", "c"],
 bools: [true, false, false],
 hshs: [{a: 1, b: 2, c:3}, {d:4, e:5}]
}

arr_with_hsh = [{a:1, b:2}, {c:3, d:4}]

puts hash_with_arr
puts arr_with_hsh

#exercise n. 11
#cannot decide for my favorite API, yet.

#exercise n. 15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if {|word| word.start_with?("s", "w")}
puts arr

#exercise n. 17
#these hashes are the same
