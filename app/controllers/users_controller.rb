class UsersController < ApplicationController
  before_action :search_item, only: [:show]

  def show
    @results = @p.result.includes(:user)
    @user = User.find(params[:id])
    redirect_to new_card_path and return unless @user.card.present?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: @user.id)
 
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end
 
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to "show"
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def search_item
    @p = Item.ransack(params[:q])
  end
 
 end