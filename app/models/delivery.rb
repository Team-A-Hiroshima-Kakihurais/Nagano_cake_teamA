class Delivery < ApplicationRecord
  belongs_to :customer
  
  def join_address_name
    "〒#{self.post_code} #{self.address} #{self.name}"
  end
end
