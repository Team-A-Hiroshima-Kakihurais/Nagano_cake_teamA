class Item < ApplicationRecord
  # 各モデルとの関係
  has_one_attached :image
  has_many :carts, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre
  
  scope :serch_genre, ->(genre) {where(genre_id: genre)}
  
  #バリデーション
  validates :name, length: { minimum: 1, maximum: 100}
  validates :introduction, length: { minimum: 1, maximum: 100}
  validates :price, length: { minimum: 1, maximum: 100}
  validates :image, presence:true
  
  # 税込金額を求めるメソッド
  def add_total_payment
    tax = 1.08
    (self.price * tax.to_f).floor
  end
  
  def get_image(width)
    unless self.image.attached?
      file_path = Rails.root.join('app/assets/images/default.jpg')
      self.image.attach(io: File.open(file_path), filename: 'default.jpg', content_type: 'image/jpeg')
    end
    self.image.variant(resize: width).processed
  end

end
