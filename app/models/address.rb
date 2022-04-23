class Address < ApplicationRecord
  belongs_to :end_user
  validates :postcode, :address, :name, presence: true
  def full_address
    '〒' + postcode + ' ' + address + ' ' + name
  end
  
end
