class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_many :comments  #User.commentsで、ユーザーの所有するコメントを取得できる。
  has_many :schedules
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags



  def full_name
    last_name + "  " + first_name
  end

  def full_name_kana
    last_name_kana + "  " + first_name_kana
  end

end
