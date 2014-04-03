class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, index: true
      t.integer :total_price
      t.integer :quatity
      t.references :order, index: true

      t.timestamps
    end
  end
end
