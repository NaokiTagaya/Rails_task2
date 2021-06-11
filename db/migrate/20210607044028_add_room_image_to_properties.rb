class AddRoomImageToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :room_image, :string
  end
end
