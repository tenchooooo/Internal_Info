class Public::ChecksController < ApplicationController
  before_action :authenticate_member!, except: [:top]

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
      @member_id = check.member.id
    end
  end

end
