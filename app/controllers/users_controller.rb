class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully created..."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Ayusin mo pag signup!!"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
