# Question 1
# case 1 will print "Hello" to screen
# case 2 will return an error. method ``bye`` is not defined in Hello class.
# case 3 will return an error. method ``greet``
# was not suplied with any arguments.
# case 4 will print "Goodbye" to screen.
# case 5 will return an error. There is no class mehod ``hi`` defined
# in the class Hello.

# Question 2
# we could define a class method ``hi`` in the class Hello.
# if we wanted it to print a message to the screen we would have to
# instantiate a new object and call instance method ``greeting`` on it.

# Question 3
# we have to assign object creation to a local variable, and supply
# the .new method with according parameters, to create an instance.

# Question 4
# we would have to create a new to_s method inside the class Cat,
# that would output the wanted string.
class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

# Question 5
# the second line would produce an error, because there is no
# instance method ``manufacturer`` defined in class Television
# the third line would run do what instance method ``model`` does.
# fifth line would produce whatever class method ``manufacturer`` does.
# sixth line would return an error, as there is no class method ``model``
# defined in the class Television.

# Question 6
# insted of self. inside the instance method definition
# we could increment the instance variable @age directly.

# Question 7
# ``attr_accessor`` and the return value in the class method
# ``self.information`` are both redundant, and should be omitted in this case.
