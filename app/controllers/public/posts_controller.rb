class Public::PostsController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  before_action :member_is_approval
  def member_is_approval
    if current_member.is_approval != true
      redirect_to  member_path(current_member.id)
      flash[:alert] = "運営承認前です"
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
       @post.create_notification_post!(current_member)
       @post.save_tag(tag_list)
       flash[:success] = '投稿完了しました'
       redirect_to post_path(@post.id)
    else
      flash[:denger] = '投稿に失敗しました'
      render :new
    end
  end

  def index
    @posts = Post.all
    @posts.each do |post|
      if post.limit.to_s(:datetime_jp) < DateTime.now.to_s(:datetime_jp)
        post.update(browse_status:1)
      end
    end

    @tag_list = Tag.all
    @post = current_member.posts.new

  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags.pluck(:tag_name).join(',')
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_member.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
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
                 .paginate(page: params[:page], per_page: 12).recent
           else
             Post.none
           end
  end




  private

  def post_params
    params.require(:post).permit(:subject, :text, :image, :limit, :browse_status, :date)
  end

end