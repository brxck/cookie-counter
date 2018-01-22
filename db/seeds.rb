# Employees

10.times do
  Employee.create(name: Faker::TwinPeaks.character,
                  pin: Faker::Number.number(4))
end

# Items

units = %w[box case bag tub can roll]

25.times do
  item = Item.create(name: Faker::Food.ingredient,
                     unit: units.select,
                     category: 'Ingredient',
                     threshold: rand(0..5),
                     value: Faker::Commerce.price)
  item.entries.build(in_stock: rand(0..50),
                     on_order: rand(0..50),
                     employee_id: rand(1..10),
                     created_at: Faker::Date.between(2.weeks.ago, Date.today)).save
end
