class HomeController < ApplicationController
  before_action :set_currentuser

  def index
    if user_signed_in?
      redirect_to users_path if @user.role == "リクルーター"
      redirect_to interviews_path( params: { id: @user.id } ) if  @user.role == "ゲスト"
    else
      redirect_to new_user_session_path
    end
  end
end
