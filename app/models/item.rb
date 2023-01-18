class Item < ApplicationRecord
  # 各モデルとの関係
  has_one_attached :image
  
  # 税込金額を求めるメソッド
  def add_total_payment(tax)
    (self.price * tax.to_f).floor
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
