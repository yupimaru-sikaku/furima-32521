class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(item_id: params[:item_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @favorite = current_user.favorites.find_by(item_id: @item.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end



