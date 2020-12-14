class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_orders, only: [:index, :show, :edit, :search]
  before_action :search_item, only: [:index, :search, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end
  
  def new
    @item = Item.new
  end
  
  def show
    @items = Item.includes(:user).order('created_at DESC')
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order(created_at: "DESC")
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @items = Item.includes(:user).order('created_at DESC')
    if @item.user.id == current_user.id && @orders.where(item_id: @item.id).blank?
      edit_item_path(@item)
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.user.id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword])
    @results = @p.result.includes(:user)
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :select_delivery_fee_id, :prefecture_id, :term_id, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_orders
    @orders = Order.includes(:user, :item)
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

end
