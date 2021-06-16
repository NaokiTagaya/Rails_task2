class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :mailaddress
      t.string :password
      t.string :password_confirm

      t.timestamps
    end
  end
end
