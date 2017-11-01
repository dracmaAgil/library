class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
