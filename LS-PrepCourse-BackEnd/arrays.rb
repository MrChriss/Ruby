#exercise n. 1
arr = [1, 3, 5, 7, 9, 11]
number = 3
arr.include?(number)

#exercise n. 2
#returns 1
#returns [1, 2, 3]

#exercise n. 3
arr = [["test", "hello", "world"],["example", "mem"]]
puts arr[1][0]

#exercise n. 4
#the value at index 5, which is 8, the sixth element in array
#syntax error
#the value at index 5, which is again 8

#exercise n. 5
#a = "e"
#b = "A"
#c = nil

#exercise n. 6
#error, if you want to change values in the array this way, you have to supply the index. we are not dealing with hashes
names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'
puts names

#exercise n. 7
array = [1, 2, 3, 4, 5]
arry = []

array.each do |value|
  arry.push(value += 2)
end

p arry
p array
