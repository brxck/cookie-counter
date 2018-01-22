class AddStockToItemsModel < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :in_stock, :integer
    add_column :items, :on_order, :integer
    add_column :items, :notes, :text
  end
end
