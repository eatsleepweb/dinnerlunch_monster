# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require 'csv'

@@tag_list = ["vegan", "diabetic safe", "lactose free", "low cal", "high fiber", "gluten free"]

rows = CSV.read("db/seed_data.csv")

def add_tags(meal)
  num_tags = rand(3) + 1
  num_tags.times do 
    meal.filter_list << @@tag_list[rand(5)]
  end
end

def find_or_create(name)
  meal = Meal.find_by_name(name)
  if meal.nil?
    meal = Meal.new
    meal.name = name
    meal.description = "This dish is delicious!"
    
    add_tags meal
    
    meal.save
  end
  meal
end

rows.each do |row|
  meal = find_or_create(row[0])
  meal.save!
  
  for i in 1..row.length
    if row[i].nil? || row[i] == ''
      break
    end
    
    dinner =find_or_create(row[i])
    dinner.save!
    
    join = LunchToDinner.new
    join.lunch = meal
    join.dinner = dinner
    join.description = "Nutritionally, #{dinner.name} is the perfect complement to #{meal.name}"
    join.save!
    
    puts "Created a dinner '#{dinner.name}' for lunch '#{meal.name}'"
  end
end
