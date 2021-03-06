class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #成功情况
      #闪现页面
      log_in @user
      flash[:success] = "欢迎来到示例App!"
      #重定向页面 redirect_to user——url(@user)
      redirect_to @user
    else
      render 'new'
    end
  end


  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

end
