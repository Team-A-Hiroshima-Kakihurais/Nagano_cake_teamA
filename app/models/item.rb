class Item < ApplicationRecord
  # 各モデルとの関係
  has_one_attached :image
  
  # 税込金額を求めるメソッド 税率は内部変数に記入
  def add_total_payment
    tax = 1.08
    (self.price * tax.to_f).floor
  end
end
