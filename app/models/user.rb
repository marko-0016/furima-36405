class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates:nickname,presence:true
  validates:email,presence:true
  validates:encrypted_password,presence:true, length: {minimum:6}
  validates:family_name,presence:true
  validates:first_name,presence:true
  validates:family_name_katakana,presence:true
  validates:first_name_katakana,presence:true
  validates:birthday,presence:true

  has_many :items
  has_many :purchases_histories

end