class Order < ApplicationRecord
  enum payment_method: {
    credit_card: 1,
    bank_transfer: 2,
    cash_of_delivery: 3
  }
  
  belongs_to :customer
end
