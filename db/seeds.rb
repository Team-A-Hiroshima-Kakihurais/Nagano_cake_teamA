# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(
  [{ name: 'ケーキ' },
  { name: '焼き菓子' },
  { name: 'プリン' },
  { name: 'キャンディ' }
  ])

Item.create(
  [{ genre_id: 1,name: 'いちごのショートケーキ', introduction:'とちおとめを贅沢に使用しています。', price: 650 },
  { genre_id: 2,name: 'チョコチップクッキー', introduction:'一口サイズで食べやすいクッキーです。', price: 480 },
  { genre_id: 3,name: 'カスタードプリン', introduction:'北海道産のミルクが味の決め手です。', price: 500 },
  { genre_id: 2,name: 'マドレーヌ', introduction:'フワフワとした食感のマドレーヌです。', price: 450 },
  { genre_id: 4,name: 'キャンディーの詰め合わせ', introduction:'いろんな味をお楽しみ頂けます。', price: 400 },
  { genre_id: 1,name: 'ロールケーキ', introduction:'放し飼い卵を使用したロールケーキです。', price: 1400 },
  { genre_id: 3,name: 'コーヒープリン', introduction:'自家焙煎したコーヒー豆で作りました。', price: 1200 },
  { genre_id: 2,name: 'フルーツタルト', introduction:'フルーツの産地にこだわって作った一品です。', price: 800 },
  { genre_id: 1,name: 'いちごのショートケーキ(ホール)', introduction:'test9', price: 2700 }
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