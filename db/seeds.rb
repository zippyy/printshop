# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all
CartItem.destroy_all


# p = Product.create!({
#   name: "Postcart",
#   size: "4x4",
#   size: "5x5",
#   finish: "UV",
#   finish: "Matte",
#   quantity: "100",
#   quantity: "200"
#   }
# )
