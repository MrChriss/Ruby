require 'sequel'
DB = Sequel.connect(adapter: 'postgres', database: 'sequel-single-table')

DB[:menu_items].each do |e|
  puts e[:item]
  puts "menu_price: $#{e[:menu_price].to_f}"
  puts "ingredients cost: $#{e[:ingredient_cost].to_f}"
  puts "preparation time: #{e[:prep_time]}"
  puts "labor: $#{format "%.2f", e[:prep_time] / 60.0 * 12}"
  puts "profit: $#{(e[:menu_price] - (e[:prep_time] / 60.0 * 12) - e[:ingredient_cost]).to_f}"
  puts ''
end
