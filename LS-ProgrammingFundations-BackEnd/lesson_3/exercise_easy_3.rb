# Question 1
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 2
  flintstones << "Dino"
  Kernel.puts(flintstones)

# Question 3
  flintstones << %w(Dino Hoppy)
  flintstones.push("Dino").push("Hoppy")
  flintstones.concat(%w(Dino Hoppy))
  Kernel.puts(flintstones)

# Question 4
  advice = "Few things in life are as important as house training your pet dinosaur."

  advice.slice!(0, advice.index('house'))
  Kernel.puts(advice)

# Question 5
  statement = "The Flintstones Rock!"
  statement.scan('t').count

# Question 6
  title = "Flintstone Family Members"
  title.center(40)
  Kernel.puts(title.center(40))
