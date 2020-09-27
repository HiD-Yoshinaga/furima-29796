class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
    @item_category = ItemCategory.find_by(id: @item.item_categories_id)
    @item_condition = ItemCondition.find_by(id: @item.item_condition_id)
    @shipping_fee = ShippingFee.find_by(id: @item.shipping_fee_id)
    @ship_from = ShipFrom.find_by(id: @item.ship_from_id)
    @day_to_ship = DayToShip.find_by(id: @item.day_to_ship_id)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :item_categories_id, :item_condition_id, :shipping_fee_id, :ship_from_id, :day_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
