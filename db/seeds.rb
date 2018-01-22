# Employees

10.times do
  Employee.create!(name: Faker::TwinPeaks.unique.character,
                  pin: Faker::Number.unique.number(4))
end

# Items

units = %w[box case bag tub can roll]

# Ingredients
25.times do
  item = Item.create!(name: Faker::Food.unique.ingredient,
                     unit: units.sample,
                     category: 'Ingredient',
                     threshold: rand(0..10),
                     value: Faker::Commerce.price)

  date = Faker::Date.between(2.weeks.ago, Date.today)
  item.entries.build(in_stock: rand(0..50),
                     on_order: rand(0..50),
                     employee_id: rand(1..10),
                     created_at: date,
                     updated_at: date).save!
end

# Prepared
25.times do
  item = Item.create!(name: Faker::Food.unique.dish,
                     unit: units.sample,
                     category: 'Prepared',
                     threshold: rand(0..10),
                     value: Faker::Commerce.price)

  date = Faker::Date.between(2.weeks.ago, Date.today)
  item.entries.build(in_stock: rand(0..50),
                     on_order: rand(0..50),
                     employee_id: rand(1..10),
                     created_at: date,
                     updated_at: date).save!
end
