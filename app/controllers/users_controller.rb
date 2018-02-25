class UsersController < ApplicationController
  before_action :set_currentuser

  def index
    @users = User.all
  end

  def show
    @interviews = @user.interviews.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_edit_path
    else
      render :edit
    end
  end

end
