class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :prevent_url, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      pay_item
      redirect_to root_path 
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code,:region_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def prevent_url
    if @item != current_user.id || @item.order_address != nil 
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end