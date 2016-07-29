# Question 1
  # nil

# Question 2
  # result is { :a=>"hi there" }

# Question 3
  # case 1: '=' is non mutable operator
  # case 2: the same, also, method create their own isolated scope
  # case 3: as the name sugests, #gsub! mutates the caller, vars change.

# Question 4
  def generate_uuid()
    characters = []
    (0..9).each { |num| characters << num.to_s }
    ('a'..'f').each { |char| characters << char}

    uuid = ""
    8.times { uuid << characters.sample }
    uuid << '-'
    4.times { uuid << characters.sample }
    uuid << '-'
    4.times { uuid << characters.sample }
    uuid << '-'
    4.times { uuid << characters.sample }
    uuid << '-'
    12.times { uuid << characters.sample }

    uuid
  end

  puts generate_uuid

# Question 5
  # def dot_separated_ip_address?(input_string)
  #   dot_separated_words = input_string.split(".")
  #   return false unless dot_separated_words.size == 4
  #   while dot_separated_words.size > 0 do
  #     word = dot_separated_words.pop
  #     return false unless is_a_number?(word)
  #   end
  #   true
  # end

 def dot_separated_ip_address?(input_string)
   if input_string.split('.', 4).last.include?('.')
     return false
   elsif input_string.count('.') < 3
     return false
   elsif input_string.split('.').join.to_i.to_s == input_string.split('.').join
     return true
   else
     return false
   end
 end

 puts dot_separated_ip_address?("192.176.58.12")
 puts dot_separated_ip_address?("12.123.23")
 puts dot_separated_ip_address?("21.12.12.12.12.12.12.12.12.1")
 puts dot_separated_ip_address?("12.12.dsad1.112ass1.1")
 puts dot_separated_ip_address?("00192.12.112.3")
