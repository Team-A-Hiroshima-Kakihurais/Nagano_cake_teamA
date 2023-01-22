class Item < ApplicationRecord
  # 各モデルとの関係
  has_one_attached :image
  has_many :carts, dependent: :destroy
  has_many :order_items, dependent: :destroy
  
  scope :serch_genre, ->(genre) {where(genre_id: genre)}
  
  def get_image(width)
    unless self.image.attached?
      file_path = Rails.root.join('app/assets/images/default.jpg')
      self.image.attach(io: File.open(file_path), filename: 'default.jpg', content_type: 'image/jpeg')
    end
    self.image.variant(resize: width).processed
  end
end
