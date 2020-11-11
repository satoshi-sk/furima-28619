class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @users = User.all
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
