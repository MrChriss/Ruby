# class MyCar
#   attr_accessor :color
#   attr_reader :year
#
#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @speed = 0
#   end
#
#   def speed_up(num)
#     @speed += num
#   end
#
#   def break(num)
#     @speed -= num
#   end
#
#   def shut_off
#     @speed = 0
#   end
#
#   def spray_paint(color)
#     self.color = color
#   end
#
#   def info
#     puts "was made in #{year}, model name: #{@model}, color:#{color}."
#     puts "it is going #{@speed} km/h."
#   end
#
#   def self.gas_mileage(liter, km)
#     puts "#{km/liter} kilometrs per liter of gas"
#   end
#
#   def to_s
#     "Car model #{@model}, created in #{year}, colored #{color}"
#   end
# end
#
# MyCar.gas_mileage(35, 450)
# my_car = MyCar.new('1994', 'Ford KA', 'silver')
# puts my_car


# exercise 3
# error ocures because we used attr_reader
# which can oly read, data but not change(write) it.
# we can change attr_reader to attr_writer or attr_accessor
class Person
  attr_writer :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
