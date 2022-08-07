class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    # 受け取った値を","で区切って配列にする。
    tag_list = params[:post][:name].to_s.split(nil)
    if @post.save
       @post.save_tag(tag_list)
       redirect_to posts_path,notice:'投稿完了しました'
    else
      render:new
    end
  end

  def index
    @posts = Post.all
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @@post,tags.pluck(:name).join(nil)
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(nil)
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id),notice:'投稿完了しました。'
    else
      render:edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:subject, :text, :image, :limit)
  end

end
