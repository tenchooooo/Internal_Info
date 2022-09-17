
class Public::ChecksController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  before_action :member_is_approval
  def member_is_approval
    if current_member.is_approval == "false"
      redirect_to  member_path(current_member.id)
    end
  end

  def create
    @post_check = Check.new(member_id: current_member.id, post_id: params[:post_id])
    @post_check.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @post_check = Check.find_by(member_id: current_member.id, post_id: params[:post_id])
    @post_check.destroy
    redirect_to post_path(params[:post_id])
  end

  def index
    @members = Member.all
    @post = Post.find(params[:post_id])
    @checks = @post.checks
    @checks.each do |check|
      @check_member_id = check.member.id
      @check_member_department = check.member.department
      @check_member_last_name = check.member.last_name
    end
  end

end