class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.index :name
      t.string :unit
      t.string :category
      t.integer :threshold
      t.integer :value
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
