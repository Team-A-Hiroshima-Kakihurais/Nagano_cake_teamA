class OrderItem < ApplicationRecord
  enum making_status: {
    not_created: 0,
    waiting_production: 1,
    in_production: 2,
    completed: 3
  }
  belongs_to :order
  belongs_to :item
  belongs_to :home
  
  def add_total_payment
    tax = 1.08
    (self.price * tax).floor
  end
  
  def add_total_payment_all
    tax = 1.08
    (self.price * tax).floor * self.amount
  end
end
