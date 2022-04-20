class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :tax_price
      t.integer :quantity
      t.integer :production_status

      t.timestamps
    end
  end
end
