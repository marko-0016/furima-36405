class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :family_name
    validates :first_name
    validates :family_name_katakana
    validates :first_name_katakana
    validates :birthday
  end
 
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'エラー内容を後から記述'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: {minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :family_name,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :family_name_katakana,format: { with: /\A[ァ-ヶ一]+\z/ }
  validates :first_name_katakana,format: { with: /\A[ァ-ヶ一]+\z/ }


  # 必要な段階くるまで以下コメントアウトにしている
  # has_many :items
  # has_many :purchases_histories

end

# １４〜１５行目、ユーザーの名字と名前に関しては下記のような要件定義がされております。
# ・漢字・平仮名・カタカナ以外では登録できないこと

# １６〜１７行目、ユーザーの名字と名前の振り仮名に関しては下記のように要件定義されております。
# ・全角カタカナ以外では登録できないこと