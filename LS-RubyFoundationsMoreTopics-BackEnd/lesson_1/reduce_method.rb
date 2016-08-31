def reduce(arry, acc = 0)
  counter = 0
  num = nil

  while counter < arry.length
    num = arry[counter]

    if block_given?
      acc = yield(acc, arry[counter])
    else
      acc += num
    end

    counter += 1
  end

  acc
end

puts reduce([1, 2, 3], 10) { |acc, num| acc - num}
