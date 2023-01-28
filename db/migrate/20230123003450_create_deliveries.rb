class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
    t.references :customer, foreign_key: {to_table: :customers}, null: false
    t.string :post_code, null: false
    t.string :address, null: false
    t.string :name, null: false
      t.timestamps
    end
  end
end
