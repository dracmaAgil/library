class AddActiveAttributeToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :active, :integer, default: 1
  end
end
