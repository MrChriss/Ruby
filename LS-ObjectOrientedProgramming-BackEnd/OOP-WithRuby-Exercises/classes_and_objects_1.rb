class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @speed = 0
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
end

hiunday = MyCar.new(1994, "lantra", "blue")

hiunday.info

hiunday.speed_up(150)
hiunday.info

hiunday.break(20)
hiunday.info

hiunday.shut_off
hiunday.info

hiunday.color = "yellow"
hiunday.info

hiunday.spray_paint("Tiger blue")
hiunday.info
