class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to "/items/#{comment.item.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
