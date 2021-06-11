class AddUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :user_id, :integer
  end
end
