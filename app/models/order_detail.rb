class OrderDetail < ApplicationRecord
  belongs_to :end_users
  belongs_to :orders

end
