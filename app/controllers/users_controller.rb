class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
  	@user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new
    @cuser = current_user
  end
  def index
  	@users = User.all
    @user = current_user
    @book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
    flash[:notice] = "You have updated user successfully."
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
