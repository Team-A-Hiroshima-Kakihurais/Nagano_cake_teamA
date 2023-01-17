class Item < ApplicationRecord
  # 画像が無い場合、デフォルト画像を設定する（個人作業では必要)

  # 各モデルとの関係
  has_one_attached :image
  
  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.png')), filename: 'default.png', content_type: 'image/png')
    end
  end
  
  
  # イメージ画像の大きさを変更する
  def add_default_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default.jpeg')
      image.attach(io: File.open(file_path), filename: 'default.jpeg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
