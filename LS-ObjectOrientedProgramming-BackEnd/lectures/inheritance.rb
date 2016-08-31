# exercise 1, 2, 3
class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim

butch = Bulldog.new
puts butch.speak
puts butch.swim

kitty = Cat.new
puts kitty.speak
puts kitty. run
puts kitty.fetch

# exercise 4
# Method lookup path is the path/ order, in which ruby looks
# for a definition of a method, in the class/ module hiararchy.
