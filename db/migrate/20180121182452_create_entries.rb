class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer :in_stock
      t.integer :on_order
      t.text :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
