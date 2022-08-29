class Public::ChecksController < ApplicationController

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
    @post = Post.find_by(id: params[:id])
    @members = Member.all
    @checks = Check.all
  end

end
