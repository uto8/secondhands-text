class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :is_sold
      t.integer :item_status
      t.integer :delivery_fee
      t.integer :delivery_day

      t.timestamps
    end
  end
end
