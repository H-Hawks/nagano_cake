class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :shipping_fee
      t.integer :bill
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
