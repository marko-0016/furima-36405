require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family_name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")
    end
    it "family_name_katakanaが空では登録できない" do
      @user.family_name_katakana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family_name_katakana can't be blank")    end
    it "first_name_katakanaが空では登録できない" do
      @user.first_name_katakana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First_name_katakana can't be blank")
    end
    it "birtdayが空では登録できない" do
      @user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
