class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def home
    @user = current_user
    #render @user.played_relationships.inspect
  end

  def update
    current_user.nickname = params[:user][:nickname]
    current_user.save
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
  end


  
  # attr_accessible :email, :password, :password_confirmation

end
