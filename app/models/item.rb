class Item < ApplicationRecord
  # 各モデルとの関係
  has_one_attached :image
  
  # 税込表示用メソッド
  def get_total_payment(tax)
    (self.price * tax.to_f).floor
  end
end
