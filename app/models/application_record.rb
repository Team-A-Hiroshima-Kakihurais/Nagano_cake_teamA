class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def add_total_payment
    tax = 1.08
    (self.price * tax).floor
  end
  
  def add_total_payment_all
    tax = 1.08
    (self.price * tax).floor * self.amount
  end
  
  
  
end
