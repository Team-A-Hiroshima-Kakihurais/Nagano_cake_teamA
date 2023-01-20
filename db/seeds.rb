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
  { genre_id: 3,name: 'item4', introduction:'test4', price: 500 },
  { genre_id: 2,name: 'item5', introduction:'test5', price: 700 },
  { genre_id: 3,name: 'item6', introduction:'test6', price: 900 },
  { genre_id: 3,name: 'item7', introduction:'test7', price: 1200 },
  { genre_id: 2,name: 'item8', introduction:'test8', price: 1500 },
  { genre_id: 1,name: 'item9', introduction:'test9', price: 2300 }
  ])

  Delivery.create(
  [{customer_id: 1,
  post_code: '7654321',
  address: '福岡県福岡市地先',
  name: '鈴木次郎'},
  {customer_id: 1,
  post_code: '9870987',
  address: '大阪府大阪市地先',
  name: '望月三郎'}
  ])