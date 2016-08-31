# exercise 1
  class TheClass
  end

  my_object = TheClass.new

# exercise 2
# Module is a collection of behaviors that is useable in
# other classes via ``mixins`` (include).

# It's purpose is to provide another way (beside classes)
# to apply polymorphic structure to Ruby.
# To group common methods, for their reusability
# To add it to lookup chain, for namespacing

# To use them with classes, keyword ``include`` is used.
module TheModule
end

class MyClass
  include TheModule
end

my_object = MyClass.new
