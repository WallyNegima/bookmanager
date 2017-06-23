class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.integer :isbn , null: false
      t.string :author
      t.string :title
      t.text :description
      t.boolean :on_loan , default: false, null: false

      t.timestamps
    end
  end
end
