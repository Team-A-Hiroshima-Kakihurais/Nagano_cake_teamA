class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def add_total_payment_all
    tax = 1.08
    (self.item.price * tax).floor * self.amount
  end
end
