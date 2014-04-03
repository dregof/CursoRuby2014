class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :state
      t.string :code

      t.timestamps
    end
  end
end
