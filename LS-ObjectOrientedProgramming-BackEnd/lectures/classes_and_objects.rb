# exercisse 1
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

p bob = Person.new('bob')
p bob.name
p bob.name = 'Robert'
p bob.name

# exercisse 2, 3, 4
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    (first_name + " " + last_name).strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    both_names = full_name.split
    self.first_name = both_names.first
    self.last_name = both_names.size > 1 ? both_names.last : ''
  end
end

p bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
p bob.last_name = 'Smith'
p bob.name

p bob.name = "John Adams"
p bob.first_name
p bob.last_name

p bob = Person.new('Robert Smith')
p rob = Person.new('Robert Smith')

p bob.name == rob.name

# exercisse 5
# it will output the code for bob object, since string interpolation
# calls to_s on the object.
#
# we can either override to_s method, or call instance method ``name``
# on object ``bob``
