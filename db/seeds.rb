# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
100.times do
  Product.create({name: Faker::Commerce.product_name, description: Faker::Lorem.sentence(3), price: Faker::Commerce.price, url: Faker::Avatar.image})
end

User.create({ email: 'admin@gmail.com', encrypted_password: 'password', admin: true  })

# t.string :email,              null: false, default: ""
#       t.string :encrypted_password, null: false, default: ""

#       ## Admin
#       t.boolean :admin, default: "false", null: false
