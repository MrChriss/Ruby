# Question 1
# since there is the ``att_reader`` method available,
# there is no need to refer to instance variable directly,
# we can just call the corresponding getter method
# in this case, Ben was right,
# instance method inside class BankAccount will work correctly.

# Question 2
# the mistake is in the usage of attr_reader for @quantity
# insted of attr_accessor or just reasigning the isntance variable.
# self.instance_variable or @instance_variable.

# Question 3
# if we use ``attr_accessor`` we could change the value of @quantity
# in two ways, either by using the method update_quantity or by using the
# setter method provided by ``attr_accessor``.

# Question 4
class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

greet = Hello.new
greet.hi

bye = Goodbye.new
bye.bye

# Question 5
class KrispyKreme
attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = @filling_type ? filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
# => "Plain"
puts donut2
# => "Vanilla"
puts donut3
# => "Plain with sugar"
puts donut4
# => "Plain with chocolate sprinkles"
puts donut5
# => "Custard with icing"

# Question 6
# both work,
# it is better to avoid ``self`` if possible.

# Question 7
# we could omit the repetative ``light`` in the class method, to make it more
# readable.
