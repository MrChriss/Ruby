def select(arry)
  counter = 0
  returned_values = []

  while counter < arry.length
    if yield(arry[counter])
      returned_values << arry[counter]
    end
    counter += 1
  end

  returned_values
end

select([1, 2, 3, 4, 5, 6]) { |num| num.odd? }
