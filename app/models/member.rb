class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :telephone_number, presence: true
  validates :department, presence: true


  has_many :posts, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_many :comments  #User.commentsで、ユーザーの所有するコメントを取得できる。
  has_many :schedules
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.encrypted_password = SecureRandom.urlsafe_base64
      member.password = SecureRandom.urlsafe_base64
      member.password_confirmation = member.password
      member.last_name = "ゲスト"
      member.last_name_kana = "げすと"
      member.first_name = "様"
      member.first_name_kana ="さま"
      member.telephone_number = "0120"
      member.department = "来客"
      member.is_approval = true
      member.is_active = true
      # member.created_at = Time.now  # Confirmable を使用している場合は必要
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
