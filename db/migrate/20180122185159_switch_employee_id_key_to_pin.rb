class SwitchEmployeeIdKeyToPin < ActiveRecord::Migration[5.1]
  def change
    remove_reference :entries, :employee
    add_column :entries, :pin, :integer
    add_index :entries, :pin

    remove_reference :wastes, :employee
    add_column :wastes, :pin, :integer
    add_index :wastes, :pin
  end
end
