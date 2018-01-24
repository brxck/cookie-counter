require 'faker'

# Employees

Employee.create(name: 'Brock McElroy', pin: '0000')

pins = Array.new(10) { Faker::Number.unique.number(4) }

(0..9).each do |i|
  Employee.create!(name: Faker::TwinPeaks.unique.character,
                   pin: pins[i])
end

# Items

units = %w[box case bag tub can roll]

# Ingredients
25.times do
  date = Faker::Time.between(2.weeks.ago, Date.today)

  item = Item.create!(name: Faker::Food.unique.ingredient,
                      unit: units.sample,
                      category: 'Ingredient',
                      threshold: rand(0..10),
                      value: Faker::Commerce.price)

  item.update_attributes(created_at: date, updated_at: date)

  10.times do
    date = Faker::Time.between(2.weeks.ago, Date.today)
    
    entry = item.entries.build(in_stock: rand(0..50),
                              on_order: rand(0..50),
                              pin: pins.sample)                      
    entry.save!

    entry.update_attributes(created_at: date, updated_at: date)  
  end
end

# Prepared
25.times do
  date = Faker::Time.between(2.weeks.ago, Date.today)  
  
  item = Item.create!(name: Faker::Food.unique.dish,
  unit: units.sample,
  category: 'Prepared',
  threshold: rand(0..10),
  value: Faker::Commerce.price)
  
  item.update_attributes(created_at: date, updated_at: date)
  
  10.times do
    date = Faker::Time.between(2.weeks.ago, Date.today)

    entry = item.entries.build(in_stock: rand(0..50),
                              on_order: rand(0..50),
                              pin: pins.sample)
    entry.save!

    entry.update_attributes(created_at: date, updated_at: date)  
  end
end

# Waste
30.times do
  date = Faker::Time.between(3.weeks.ago, Date.today)

  waste= Waste.create!(quantity: rand(0..10),
                item_id: rand(1..50),
                pin: pins.sample)

  waste.update_attributes(created_at: date, updated_at: date)
end
