class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.string :reference, null: false
      t.integer :price, default: 0
      t.integer :stock, default: 0
      t.references :category, index: true

      t.timestamps
    end
  end
end
