# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

books = Category.create(name: "Libros", key: "books")
Category.create(name: "Deportes", key: "sport")

%w"Rails Ruby HTML CSS".each do |name|
  Product.create(name: name, reference: rand(10000), category: books)
end
