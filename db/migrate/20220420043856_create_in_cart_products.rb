class CreateInCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :in_cart_products do |t|
      t.integer :product_id
      t.integer :end_user_id
      t.integer :quantity

      t.timestamps
    end
  end
end
