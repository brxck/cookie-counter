class EntriesBelongToEmployees < ActiveRecord::Migration[5.1]
  def change
    remove_reference :entries, :user
    add_reference :entries, :employee

    remove_reference :wastes, :user
    add_reference :wastes, :employee
  end
end
