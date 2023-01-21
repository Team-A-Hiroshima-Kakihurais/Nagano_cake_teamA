class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :customer, foreign_key: {to_table: :customers}
      t.references :item, foreign_key: {to_table: :items}
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
