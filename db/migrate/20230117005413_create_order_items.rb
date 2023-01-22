class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: {to_table: :orders}
      t.references :item, foreign_key: {to_table: :items}
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, defalut: 0
      t.timestamps
    end
  end
end
