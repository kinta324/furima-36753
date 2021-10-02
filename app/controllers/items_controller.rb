class ItemsController < ApplicationController
  before_action :authenticate_user!, only: new
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
   else
      redirect_to user_session_path(@item.id)
   end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end    
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :item_condition_id, :postage_id, :region_id, :shipping_date_id, :description, :image).merge(user_id: current_user.id)
  end
end
