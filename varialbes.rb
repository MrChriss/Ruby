#exercise n. 1
puts "Input your name."
name = gets.chomp
puts "Hello " + name

#exercise n. 2
puts "How old are you?"
age = gets.chomp.to_i
puts "In 10 years you will be: "
puts age + 10
puts "In 20 years you will be: "
puts age + 20
puts "In 30 years you will be: "
puts age + 30
puts "In 40 years you will be: "
puts age + 40

#exercise n. 3
10.times {puts name}

#exercise n. 4
puts "Input your last name"
last_name = gets.chomp
puts "hello " + name + " " + last_name

#exercise n. 5
#in the first case it prints 3
#in second case it throws and error, beacause variable x is only availeble whitin the scope of the block

#exercise n. 6
#variable shoes is out of scope.
