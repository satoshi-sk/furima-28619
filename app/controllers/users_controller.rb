class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  private
  def user_params
    params.require(:user).permit()
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
