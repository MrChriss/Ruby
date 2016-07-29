# Question 1
  munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
  }
  total_age = 0
  munsters.each do |name, details|
    total_age += details["age"] if details["gender"] == "male"
  end
  puts total_age

# Question 2
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  munsters.each do |name, details|
    puts "#{name} is #{details['age']} years old #{details['gender']}."
  end

# Question 3
  # add a return statement, that returns both parameters

# Question 4
  sentence = "Humpty Dumpty sat on a wall."
  puts sentence.split(' ').reverse.join(' ')

# Question 5
  # 34

# Question 6
  # it changes the original hash
  # ?

# Question 7
  # returns paper

# Question 8
  # returns "no"
  # we pass method foo as a parameter to method bar
  # foo always returns "yes", so bar returns "no"
