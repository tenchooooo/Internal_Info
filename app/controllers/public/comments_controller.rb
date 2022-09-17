
class Public::CommentsController < ApplicationController
  before_action :authenticate_member!, except: [:top]

  def create
    @comment = current_member.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path) #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] =  "コメントを入力してください."
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
    #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end