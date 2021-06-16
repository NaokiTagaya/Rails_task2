class UsersController < ApplicationController
  # プロフィール情報画面
  def show
    @user = current_user
  end

  # アカウント情報画面
  def account_show
    @user = current_user
  end

  # プロフィール情報更新
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:image, :user_name, :user_introduction)
  end

end
