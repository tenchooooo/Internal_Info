class Admin::PostsController < ApplicationController

  def index
    @posts = Post.all
    @tag_list = Tag.all

  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags.pluck(:tag_name).join(',')
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    @checks = @post.checks
  end

  def edit
    @post = Post.find(params[:id])
    @tags = @post.tags.pluck(:tag_name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tags = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @old_relations=PostTag.where(post_id: @post.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @post.save_tag(tags)
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

  def post_search
    @section_title = "「#{params[:search]}」の検索結果"
    @posts = if params[:search].present?
             Post.where(['text LIKE ? OR subject LIKE ?',
                        "%#{params[:search]}%", "%#{params[:search]}%"])
           else
             Post.none
           end

  end



  private

  def post_params
    params.require(:post).permit(:subject, :text, :image, :limit, :browse_status, :date)
  end
end
