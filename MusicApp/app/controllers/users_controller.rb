class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save!
      login!(@user)
      redirect_to users_url(user_params[:id])
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end


  def user_params
    params.require(:user).permit(:email, :password)
  end

end
