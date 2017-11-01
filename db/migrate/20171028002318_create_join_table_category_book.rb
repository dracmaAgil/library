class CreateJoinTableCategoryBook < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :books do |t|
      t.index [:category_id, :book_id]
    end
  end
end
