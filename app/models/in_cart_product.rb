class InCartProduct < ApplicationRecord
 belongs_to :product
 belongs_to :end_user
 
 has_one_attached :image

end
