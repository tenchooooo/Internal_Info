# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    top_path
  end
  def new_guest
    member = Member.guest
    sign_in member
    redirect_to top_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  before_action :reject_member, only: [:create]

  protected

  def reject_member
    @member = Member.find_by(email: params[:member][:email])
    return if !@member
    # 「1」のアカウントが存在している場合、そのアカウントのパスワードとログイン画面で入力されたパスワードが 一致しているかを確認する
    # Deviseが用意しているメソッド（ユーザー情報.valid_password?(入力されたパスワード)
    if @member.valid_password?(params[:member][:password]) && (@member.is_active == false)
      redirect_to new_member_registration_path
      flash[:notice] = "退会済みユーザーです。"
    else
      flash[:notice] = "必須項目を入力してください。"
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end