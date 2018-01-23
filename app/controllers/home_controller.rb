class HomeController < ApplicationController
  before_action :set_currentuser

  def index
    if user_signed_in? && @user.role == "リクルーター"
        redirect_to users_path
    end
    if user_signed_in? && @user.role == "ゲスト"
        redirect_to interviews_path( params: { id: @user.id } )
    end
  end
  
end
