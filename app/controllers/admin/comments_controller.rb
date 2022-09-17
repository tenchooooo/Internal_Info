class Admin::CommentsController < ApplicationController
  def destroy
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = "削除しました"
  end

end
