# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create(
  [{ name: 'genre1' }, 
   { name: 'genre2' },
   { name: 'genre3' }
   ])
  
Item.create(
  [{ genre_id: 1,name: 'item1', introduction:'test1', price: 100 }, 
  { genre_id: 2,name: 'item2', introduction:'test2', price: 200 },
  { genre_id: 3,name: 'item3', introduction:'test3', price: 300 },
  ])