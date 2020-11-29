class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item  = Item.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :select_delivery_fee_id, :prefecture_id, :term_id).merge(user_id: current_user.id)
  end
end
