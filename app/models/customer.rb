class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  
  validates :last_name, length: { in: 2..20 },
                   uniqueness: true
  validates :first_name, length: { in: 2..20 },
                   uniqueness: true
  validates :last_name_kana, presence: true, format: /\A[\p{katakana}]+\z/
  validates :first_name_kana, presence: true, format: /\A[\p{katakana}]+\z/
  validates :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :post_code, presence: true, format: /\A\d{7}\z/
  validates :address, presence: true
  validates :phone_number, presence: true, format: /\A\d{10,11}\z/
  
  def add_delivery_address
    "〒#{self.post_code} #{self.address}"
  end

  def add_full_name
    "#{self.last_name} #{self.first_name}"
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
