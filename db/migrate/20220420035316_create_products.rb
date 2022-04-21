class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id, null:false
      t.string :name, null:false
      t.integer :non_taxed_price, null:false
      t.text :description, null:false
      t.boolean :is_active, default:true, null:false

      t.timestamps
    end
  end
end
