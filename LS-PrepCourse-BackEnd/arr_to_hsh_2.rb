
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_info = [:email, :address, :phone]

contacts.each_with_index do |(key, value), ind|
  contact_data[ind].each_index do |index|
    value[contact_info[index]] = contact_data[ind][index]
  end
end

puts contacts
