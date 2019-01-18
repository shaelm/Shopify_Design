100.times do
  Product.create({
    title: Faker::Food.vegetables,
    inventory_count: rand(10),
    price: rand() + rand(3)
                  })
end