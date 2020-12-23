class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    if user_signed_in? 
    else
      redirect_to user_session_path
    end

    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end

    @order = UserItem.new
  end

  def create
    @order = UserItem.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_item).permit(:order_id, :post_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
