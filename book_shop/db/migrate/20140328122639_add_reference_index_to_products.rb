class AddReferenceIndexToProducts < ActiveRecord::Migration
  def change
    add_column :products, :position, :integer
    add_index :products, :reference, unique: true
  end
end
