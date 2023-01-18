class Item < ApplicationRecord
  # 各モデルとの関係
  has_one_attached :image
  
  # 税込金額を求めるメソッド
  def add_total_payment(tax)
    (self.price * tax.to_f).floor
  end
  
  def get_profile_image
    (image.attached?) ? image : 'default.jpeg'
  end
  
end
