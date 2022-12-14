
class Public::MembersController < ApplicationController
  before_action :authenticate_member!, except: [:top]


  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path(current_member.id), success: t('投稿完了しました。')
    else
      render :edit
    end
  end

  def posts
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)

    @tag_list = Tag.all
  end

  def schedules
    @schedules = Schedule.all
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :telephone_number, :department)
  end
end