class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # deviseモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def update_without_current_password(params, *options)
    params.delete(:current_password)
      
    if params[:password].blank? && params[:password_confirmation].blank?
        params.delete(:password)
        params.delete(:password_confirmation)
    end
      
    result = update(params, *options)
    clean_up_passwords
    result
  end
  
  # 画像アップロード
  mount_uploader :image, ImageUploader
         
  # 正規表現を定義
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  
  # バリデーション
  validates :user_name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password_confirmation, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }, on: :create

  # リレーション
	has_many :properties
	has_many :bookings

end
