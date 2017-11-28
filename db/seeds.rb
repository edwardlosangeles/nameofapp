# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#sample
#Product.create(name: "Prod3", description: "created in seeds.rb", image_url: "work/zion.jpg")


Comment.create(user_id: 1, body: "it was just okay", rating: 3, product_id: 12)
Comment.create(user_id: 1, body: "horrible", rating: 1, product_id: 12)
Comment.create(user_id: 1, body: "Life changing", rating: 5, product_id: 12)
Comment.create(user_id: 1, body: "just to increase the average", rating: 5, product_id: 12)
Comment.create(user_id: 2, body: "test", rating: 5, product_id: 14)
Comment.create(user_id: 2, body: "test", rating: 5, product_id: 13)
Comment.create(user_id: 2, body: "test", rating: 4, product_id: 13)
Comment.create(user_id: 2, body: "test", rating: 5, product_id: 13)
Comment.create(user_id: 1, body: "test", rating: 2, product_id: 14)