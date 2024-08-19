class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to posts_path, notice: "Updated user account!"
    else
      flash.now[:error] = "Unable to save your user account"
      render :edit, :unprocessable_entity
    end
  end

  def show

    @user = User.find(current_user.id)

  end

  private

  def user_params

    params.require(:user).permit(:first_name)

  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(@user) unless @user == current_user
  end

end
