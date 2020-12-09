class FavoritesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.new(item_id: @item.id)
    favorite.save
    # render json: { item: favorite }
    # redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: @item.id)
    favorite.destroy
    # render json: { item: favorite }
    # redirect_back(fallback_location: root_path)
  end


end



