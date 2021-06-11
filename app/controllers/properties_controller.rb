class PropertiesController < ApplicationController

  # トップページ
  def top
  end
  
  # ルーム情報登録画面
  def new
    @property = Property.new
  end

  # ルーム情報登録処理
  def create
    @property = Property.new(properties_params)
    if @property.save
      flash[:notice] = "ルーム情報を登録しました"
      redirect_to property_path(id: @property)
    else
      render "new"
    end
  end

  # ルーム情報検索処理
  # recordcount:検索結果件数のカウント
  def search
    # エリアとキーワード両方入力された場合
    if params[:area].present? && params[:keyword].present? 
      @properties = Property.where('address LIKE(?) and room_name LIKE(?) or address LIKE(?)', "%#{params[:area]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
      @recordcount = Property.where('address LIKE(?) and room_name LIKE(?) or address LIKE(?)', "%#{params[:area]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%").count
    # エリアのみが入力された場合
    elsif params[:area].present?
      @properties = Property.where('address LIKE ?', "%#{params[:area]}%")
      @recordcount = Property.where('address LIKE ?', "%#{params[:area]}%").count
    # キーワードのみが入力された場合
    elsif params[:keyword].present?
      @properties = Property.where('room_name LIKE(?) or address LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
      @recordcount = Property.where('room_name LIKE(?) or address LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").count
    # 何も入力せずに検索した場合
    else
      @properties = Property.all
      @recordcount = Property.count
    end
  end

  # ルーム情報詳細画面
  def show
    @property = Property.find(params[:id])
    @booking = Booking.new
  end

  def posts
    @posts = Property.where(user_id: current_user.id)
  end

  private
  def properties_search_params
    params.fetch(:search, {}).permit(:address, :room_name)
  end

  def properties_params
    params.require(:property).permit(:room_name, :room_introduction, :fee, :address, :room_image, :user_id)
  end

end
