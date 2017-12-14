# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


test = Product.find_by(id: 14)
test.update(image_url: 'work/large/hawaii.jpg')
test.update(image_thumb: 'work/small/hawaii.jpg')
test = Product.find_by(id: 15)
test.update(image_url: 'work/large/hollywood.jpg')
test.update(image_thumb: 'work/small/hollywood.jpg')
test = Product.find_by(id: 20)
test.update(image_url: 'work/large/joshuatree.jpg')
test.update(image_thumb: 'work/small/joshuatree.jpg')
test = Product.find_by(id: 21)
test.update(image_url: 'work/large/philippines.jpg')
test.update(image_thumb: 'work/small/philippines.jpg')
test = Product.find_by(id: 19)
test.update(image_url: 'work/large/puertorico.jpg')
test.update(image_thumb: 'work/small/puertorico.jpg')
test = Product.find_by(id: 17)
test.update(image_url: 'work/large/sequoia.jpg')
test.update(image_thumb: 'work/small/sequoia.jpg')
test = Product.find_by(id: 16)
test.update(image_url: 'work/large/yosemite.jpg')
test.update(image_thumb: 'work/small/yosemite.jpg')
test = Product.find_by(id: 22)
test.update(image_url: 'work/large/zion.jpg')
test.update(image_thumb: 'work/small/zion.jpg')
test = Product.find_by(id: 13)
test.update(image_url: 'work/large/grandcanyon.jpg')
test.update(image_thumb: 'work/small/grandcanyon.jpg')
test = Product.find_by(id: 12)
test.update(image_url: 'work/large/deathvalley.jpg')
test.update(image_thumb: 'work/small/deathvalley.jpg')

