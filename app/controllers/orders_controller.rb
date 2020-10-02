class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]

  def index
    @order = OrderOrderInfo.new
    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_url
    end
    if @item.order.present?
      redirect_to root_url
    end
  end

  def create
    # binding.pry
    @order = OrderOrderInfo.new(order_order_info_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_order_info_params
    params.permit(:postcode, :shipping_address_id, :city, :house_number, :building_name, :phone_number, :item_id, :token ).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: order_order_info_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
