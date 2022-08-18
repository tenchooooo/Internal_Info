class Public::CommentsController < ApplicationController

  def create
    @comment = current_member.comments.new(comment_params)
    if @comment.save
      redirect_to posts_path, success: t('投稿完了しました')
    else
      redirect_to posts_path, success: t('投稿完了しました')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
    #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
