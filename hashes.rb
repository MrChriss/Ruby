#exercise n. 1
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
close_family = family.select do |key, value|
  key == :sisters || key == :brothers
end
p close_family.values.flatten

#exercise n. 2
a = {a: 1, b: 2, c: 3}
b = {d: 4, e: 5, f: 6}
#original hash a remains the same
a.merge(b)
p a
#hash a is transformed, values from hash b are added
a.merge!(b)
p a

#exercise n. 3
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}
hash.each do |key, value|
  puts key
  puts value
  puts "Key: #{key}, value: #{value}"
end

#exercise n. 4
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
puts person[:name]

#exercise n. 5
people = {number: 100, language: "human"}
puts people.has_value?("human")

#exercise n. 6
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
words_new = {}
words.map do |word|
  anagram = word.split('').sort.join
  if words_new.has_key?(anagram)
    words_new[anagram] << word
  else
    words_new[anagram] = [word]
  end
end
words_new.each do |key, value|
  puts "key: #{key}, value: #{value}"
end

#exercise n. 7
#first hash uses a symbol as key, the secont uses a variable

#exercise n. 8
#B
