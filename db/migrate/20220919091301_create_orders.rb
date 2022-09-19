class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :buyer, null: true, foreign_key: { to_table: :users }
      t.references :seller, null: true, foreign_key: { to_table: :users }
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
