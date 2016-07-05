#exercise n. 1
words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
words.each do |word|
  if word =~ /lab/
    puts word
  end
end

#exercise n. 2
#nothing, the .call method inside the method block is missing

#exercise n. 3
#exeption handling, handels errors and unexpected events or values, it tells the program what to do, when it encounters one

#exercise n. 4
def execute(&block)
  block.call
end
execute { puts "Hello from inside the execute method!" }

#exercise n. 5
#the & sign is missing in front of parameter.
