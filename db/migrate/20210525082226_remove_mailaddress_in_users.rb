class RemoveMailaddressInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :mailaddress, :varchar
  end
end
