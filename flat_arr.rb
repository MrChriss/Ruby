a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

new_arr = []

a.map do |word|
  new_arr.push(word.split(" "))
end

puts new_arr
new_arr
