class CommentsController < InternalController
  respond_to :js

  def index
    Comment.all
  end

  def create
    comment.save ? head(:ok) : head(:unprocessable_entity)
  end

  def destroy
    comment.destroy ? head(:ok) : head(:unprocessable_entity)
  end

private
  def comment
    Comment.owned_by_user(current_user).find_by(id: params[:id]) || Comment.new(comment_params)
  end

  def comment_params
    params.require(:comment).permit(
      :commentable_id,
      :commentable_type,
      :message).merge(user_id: current_user.id)
  end
end