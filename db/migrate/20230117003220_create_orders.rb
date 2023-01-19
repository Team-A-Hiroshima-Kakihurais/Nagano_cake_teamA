class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: {to_table: :customers}
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, defalut: 1
      t.integer :status, null: false
      t.timestamps
    end
  end
end
