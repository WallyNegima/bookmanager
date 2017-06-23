class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.date :returned_at

      t.timestamps
    end
  end
end
