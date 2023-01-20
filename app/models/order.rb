class Order < ApplicationRecord
  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1,
    cash_of_delivery: 2
  }
  enum status: {
    waiting_for_payment: 0,
    payment_confirmation: 1,
    now_at_work: 2,
    shopping_preparation: 3,
    shopped: 4
  }
  
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  
  def add_full_address
    "#{self.post_code} #{self.address} "
  end
  
  def add_item_list
    self.order_items.map do |i|
      i.item.name
    end
  end
end
