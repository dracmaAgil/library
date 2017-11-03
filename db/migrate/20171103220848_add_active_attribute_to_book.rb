class AddActiveAttributeToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :active, :integer, default: 1
  end
end
