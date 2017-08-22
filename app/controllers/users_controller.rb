class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end

  def new
    @user = User.new
  end

  def confirm
    build_user
  end

  def create
    build_user

    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  private

  def build_user
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
