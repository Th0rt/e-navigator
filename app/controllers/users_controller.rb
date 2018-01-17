class UsersController < ApplicationController
  def show
    @user = User.find(current_user[:id])
  end

  def edit
    @user = User.find(current_user[:id])
  end

  def update
    @user = User.find(current_user[:id])
    if @user.update(user_params)
      redirect_to users_edit_path
    else
      render :edit
    end
  end

end
