class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Welcome to MoneyMouth!"
      redirect_to signup_url
    else
      flash[:notice] = "There was a problem creating your user."
      render :action => :new
    end
  end
end
