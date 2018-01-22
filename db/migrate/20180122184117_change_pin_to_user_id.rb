class ChangePinToUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :pin
  end
end
