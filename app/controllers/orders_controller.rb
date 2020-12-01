class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user_id == current_user.id
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(@order_address.item_id)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id).merge(item_id: params[:item_id]).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
 end
 
end