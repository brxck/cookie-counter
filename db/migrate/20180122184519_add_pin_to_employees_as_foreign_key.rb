class AddPinToEmployeesAsForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :pin, :integer
    add_index :employees, :pin
  end
end
