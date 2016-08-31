# Question 1
# all of the folowing are objects
# to find wich classes they belong to,
# use .class instance method of Object class.
# true.class
# => TrueClass
# "hello".class
# => String
# [1, 2, 3, "happy days"].class
# => Array
# 142.class
# => Fixnum

# Question 2
# by including the modlue Speed in the classes Car and Truck
# to find out if a class has a method, call the method
# on an instance of the class.


# Question 3
# this is because we used ``self.class`` in method definition
# self inside the method definition refers to the instance of the class
# self.class therefore refers to the class of the instance, which is Car.

# Question 4
# to initiate a new object of class AngryCat, we use
# .new instance method of class Class.

# Question 5
# class Pizza has an instance variable,
# class Fruit has a local variable.
# instance variables' names are preceded by ``@``
# alternatively, instance method .instance_variables,
# could be called on object to get an array containig
# all the instance variables of the object.

# Question 6
# to access instance variable, we could define a ``getter method``
# by using instance method ``attr_reader`` of class Module.
# or by "manualy" definig a method, which returns the instance variable.
# or by calling the instance method .instance_variable_get of class Object
# and supplying it with the instance variable.

# Question 7
# calling to_s method on object, will print the object's class and an
# encoding of the object id to the console.

# Question 8
# ``self`` in the definition of an instance method refers to the instance
# (object), that called the method.

# Question 9
# ``self`` in the name of class mehod refers to the class itself

# Question 10
# in this case, if we want to initialize a new instance, we have to call
# the method .new, and suply it with two arguments.
