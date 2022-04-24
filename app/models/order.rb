class Order < ApplicationRecord
  belongs_to :products
  belongs_to :end_users
  enum payment_method: { credit_card: 0, transfer: 1 }

end
