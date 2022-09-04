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
      redirect_to admin_member_path(@member.id), success: t('投稿完了しました。')
    else
      render :edit
    end
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :telephone_number, :department, :is_active, :is_approval)
  end
end
