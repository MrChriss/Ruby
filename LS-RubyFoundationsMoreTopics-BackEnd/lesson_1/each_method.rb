def each(arry)
  counter = 0

  while counter < arry.length
    yield(arry[counter])
    counter += 1
  end
  
  arry
end


my_array = %w(1 2 3 4 5 6 7 8 9)
ar = %w(a b c d e f g h)
each(my_array) do |num|
  puts num
end

each(ar) do |num|
  puts num
end

each([1, 2, 3]) { |element| puts "sdasdad" }
