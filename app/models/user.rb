class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
end



# |  Coliumn           |  Type      | Option    |
# |------------        |--------    |--------   |
# |nickname            |string      |null:false |
# |email               |string      |unique: true, null:false|
# |encrypted_password  |string      |null:false |
# |family_name         |string      |null:false |
# |first_name          |string      |null:false |
# |family_name_katakana         |string      |null:false |
# |first_name_katakana          |string      |null:false |
# |birthday            |date    |null:false|

# ## Association
# - has_many :items
# - has_many :purchases_histories


# <!-- 
# ・usersテーブルが持っている情報
# ニックネーム
# メールアドレス
# パスワード（６文字以上）→passwordカラムは削除。deviseのgemがあらかじめ用意しているencrypted_passwordを使用しているため。
# パスワード（確認）
# お名前(全角)
# お名前カナ(全角)
# 生年月日  ここだけプルダウンして選択-->