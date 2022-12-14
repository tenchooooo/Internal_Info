class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      if @member.is_active == false
        @member.update(is_approval: false)
      end
      redirect_to admin_member_path(@member.id), success: t('編集完了しました。')
    else
      render :edit
    end
  end
  def posts
    @posts = Post.all
    @member = Member.find(params[:member_id])
    @tag_list = Tag.all
  end

  def schedules
    @schedules = Schedule.all
    @member = Member.find(params[:member_id])
  end


  def member_params
    params.require(:member).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :telephone_number, :department, :is_active, :is_approval)
  end
end
