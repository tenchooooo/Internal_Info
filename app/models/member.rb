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
  
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.encrypted_password = SecureRandom.urlsafe_base64
      member.last_name = "ゲスト"
      member.last_name_kana = "げすと"
      member.first_name = "様"
      member.first_name_kana ="さま"
      member.telephone_number = "0120"
      member.department = "来客"
      member.is_approval = true
      member.is_active = true
      member.created_at = Time.now  # Confirmable を使用している場合は必要
      member.updated_at = Time.now
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end



  def full_name
    last_name + "  " + first_name
  end

  def full_name_kana
    last_name_kana + "  " + first_name_kana
  end

end
