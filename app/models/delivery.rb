class Delivery < ApplicationRecord
  belongs_to :customer
  
  validates :post_code, presence: true, format: /\A\d{7}\z/
  validates :address, presence: true
  validates :name, length: { in: 2..20 },
                   uniqueness: true
  
  def join_address_name
    "〒#{self.post_code} #{self.address} #{self.name}"
  end
end
