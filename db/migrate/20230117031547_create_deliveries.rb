class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :post_code
      t.string :address
      t.string :name
      t.timestamps
    end
  end
end
