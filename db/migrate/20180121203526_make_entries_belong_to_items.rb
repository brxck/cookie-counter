class MakeEntriesBelongToItems < ActiveRecord::Migration[5.1]
  def change
    remove_reference :items, :entry
    add_reference :entries, :item
  end
end
