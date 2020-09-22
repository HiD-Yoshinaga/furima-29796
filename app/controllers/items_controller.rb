class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  def index
    @items = Item.all
  end

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :item_categories_id, :item_condition_id, :shipping_fee_id, :ship_from_id, :day_to_ship_id).merge(user_id: current_user.id)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
