# exercise 1
require 'pry'
module Affordable
  def can_afford?(cash)
    cash > 2000 ? true : false
  end
end

class Vehicle
  @@num_of_vehicles = 0
  attr_accessor :color, :speed, :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @speed = 0
    @@num_of_vehicles += 1
  end

  def keep_track
    puts "There are #{@@num_of_vehicles} vehicles."
  end

  def speed_up(num)
    @speed += num
  end

  def break(num)
    @speed -= num
  end

  def shut_off
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def info
    puts "was made in #{year}, model name: #{@model}, color:#{color}."
    puts "it is going #{@speed} km/h."
  end

  def self.gas_mileage(liter, km)
    puts "#{km / liter} kilometrs per liter of gas"
  end

  def to_s
    "Car model #{@model}, created in #{year}, colored #{color}"
  end

  def age
    years_old
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  include Affordable
  NUM_OF_WHEELS = 4
end

class MyTruck < Vehicle
  MAX_CARGO = 9999
end

p truck = MyTruck.new(1994, 'bmw', 'white')
p car = MyCar.new(2000, 'mazda', 'blue')
p truck.speed_up(30)
p truck.speed
p some = Vehicle.new(3000, 'ads', 'asd')
p some.keep_track

p car.can_afford?(30000)

p MyCar.ancestors
p MyTruck.ancestors
p Vehicle.ancestors

p truck.age

# exercise 7
class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end


  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

me = Student.new("Me", 300)
you = Student.new("You", 299)

puts "Well done!" if me.better_grade_than?(you)

# exercise 8
# The problem is that, instance method ``.hi`` is private
# and therefore cannot be called from outside the class
# The method should be cnaged to public.
