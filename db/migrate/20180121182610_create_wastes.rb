class CreateWastes < ActiveRecord::Migration[5.1]
  def change
    create_table :wastes do |t|
      t.references :item, foreign_key: true
      t.integer :quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
