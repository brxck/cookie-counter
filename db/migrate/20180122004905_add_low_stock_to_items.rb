class AddLowStockToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :low_stock, :boolean
  end
end
