class Property < ApplicationRecord
	# リレーション
	belongs_to :user
	has_many :bookings

	# バリデーション
	validates :room_name, presence: true
	validates :room_introduction, length: { in: 10..500 }, presence: true
	validates :fee, numericality: true, presence: true
	validates :address, presence: true
	validates :room_image, presence: true

	# アップローダー設定
	mount_uploader :room_image, RoomimageUploader
end
