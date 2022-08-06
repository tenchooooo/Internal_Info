class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # 受け取った値を","で区切って配列にする。
    tag_list = params[:post][:name].split(',')
    if @post.save
       @post.save_tag(tag_list)
       redirect_to post_path,notice:'投稿完了しました'
    else
      render:new
    end
  end
  
  def index
    @posts = Post.page(params[:page]).per(10)
    @tag_list = Tag.all
  end
  
  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end

  private

  def post_params
    params.require(:post).permit(:subject, :text, :image, :limit)
  end

end
