require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "aaa", email: "", password: "00000000", family_name: "nakatani", first_name: "masayuki", family_name_katakana: "nakatani", first_name_katakana: "masayuki", birthday: "aaaa")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "", family_name: "nakatani", first_name: "masayuki", family_name_katakana: "nakatani", first_name_katakana: "masayuki", birthday: "aaaa")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", family_name: "", first_name: "masayuki", family_name_katakana: "nakatani", first_name_katakana: "masayuki", birthday: "aaaa")
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", family_name: "nakatani", first_name: "", family_name_katakana: "nakatani", first_name_katakana: "masayuki", birthday: "aaaa")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_katakanaが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", family_name: "nakatani", first_name: "masayuki", family_name_katakana: "", first_name_katakana: "masayuki", birthday: "aaaa")
      user.valid?
      expect(user.errors.full_messages).to include("Family name katakana can't be blank")    end
    it "first_name_katakanaが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", family_name: "nakatani", first_name: "masayuki", family_name_katakana: "nakatani", first_name_katakana: "", birthday: "aaaa")
      user.valid?
      expect(user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it "birtdayが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", family_name: "nakatani", first_name: "masayuki", family_name_katakana: "nakatani", first_name_katakana: "masayuki", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end



