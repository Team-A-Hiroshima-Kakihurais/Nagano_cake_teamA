class Item < ApplicationRecord
  # 各モデルとの関係
  has_one_attached :image
  has_many :carts, dependent: :destroy
  has_many :order_items, dependent: :destroy
  
  # 税込金額を求めるメソッド 税率は内部変数に記入
end
