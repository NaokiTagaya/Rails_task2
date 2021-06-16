class BookingsController < ApplicationController
  # 予約済み一覧画面
  def index
    @bookings = Booking.all
  end

  # 予約内容確認画面
  def confirm
    @booking = Booking.new(booking_params)
    redirect_to property_path(id: @booking.property_id) if @booking.invalid?
  end

  # 予約確定処理
  def create
    @booking = Booking.new(booking_params)
    render :confrim and return if params[:back] || !@booking.save
      flash[:notice] = "予約を確定しました"
      redirect_to bookings_result_path(id:@booking)
  end

  # 予約内容確定画面
  def result
    @booking = Booking.find(params[:id])
  end

  # モデルBooking登録param
  private
  def booking_params
    params.require(:booking).permit(:total_charge, :booking_start, :booking_end, :booking_confirmed, :property_id, :user_id, :persons)
  end
end
