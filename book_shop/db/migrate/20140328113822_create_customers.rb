class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :lastname
      t.string :address
      t.string :city
      t.string :credit_card_number
      t.references :user, index: true

      t.timestamps
    end
  end
end
