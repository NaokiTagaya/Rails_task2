class Booking < ApplicationRecord
	# リレーション
	belongs_to :user
	belongs_to :property

	#バリデーション
	with_options presence: true do
		validates :booking_start
		validates :booking_end
		validates :persons
	end

	validate :date_before_start
	validate :date_after_end

	def date_before_start
		unless booking_start == nil # 空ではないのかチェック
			errors.add(:booking_start, "は今日以降の日付を入力してください") if booking_start < Date.today
		end
	end

	def date_after_end
		unless booking_end == nil # 空ではないのかチェック
			errors.add(:booking_end, "は開始日以降の日付を入力してください") if booking_end < booking_start
		end
	end
end
