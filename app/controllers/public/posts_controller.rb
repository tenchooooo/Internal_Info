class Public::PostsController < ApplicationController
  before_action :limit

  def limit
    @posts = Post.all
    @posts.each do |post|
      if post.limit >= Time.now.tomorrow
        post.update(browse_status: 1)
        post.tags.update(tag_status: 1)
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_member.posts.new(post_params)
    # 受け取った値を" "で区切って配列にする。
    tag_list = params[:post][:tag_name].to_s.split(nil)
    if @post.save
       @post.save_tag(tag_list)
       redirect_to posts_path, success: t('投稿完了しました')
    else
      render　:new
    end
  end

  def index
    @posts = Post.all
    @tag_list = Tag.all
    @post = current_member.posts.new

  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags.pluck(:tag_name).join(',')
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post,tags.pluck(:name).join(nil)
  end

  def update
    @post = Post.find(params[:id])
    tags = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.update_tags(tags)
      redirect_to post_path(@post.id), success: t('投稿完了しました。')
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, success: t('削除しました')
  end

  def search
    @tag_list = Tag.all # 投稿一覧表示ページでもすべてのタグを表示するために、タグを全聚徳
    @tag = Tag.find(params[:tag_id]) # クリックしたタグを取得
    @posts = @tag.posts.all # クリックしたタグに紐づけられた投稿をすべて表示

  end



  private

  def post_params
    params.require(:post).permit(:subject, :text, :image, :limit, :browse_status)
  end

end
