require 'rails_helper'

  RSpec.describe PurchasePurchasesHistory, type: :model do
    before do
      @purchase_purchases_history = FactoryBot.build(:purchase_purchases_history)
    end

    describe "購入画面" do
      context '購入できないとき' do
        it "postal_codeが空だと登録できない" do
          @purchase_purchases_history.postal_code = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Postal code can't be blank")
        end
        it "postal_codeは半角文字列でないと登録できない" do
          @purchase_purchases_history.postal_code = 'あああ'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Postal code is invalid")
        end
        it "postal_codeは3桁ハイフン4桁の半角文字列でないと登録できない" do
          @purchase_purchases_history.postal_code = '１２３４ー５６７'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Postal code is invalid")
        end
        it "shipping_area_idが--だと登録できない" do
          @purchase_purchases_history.shipping_area_id = 0
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Shipping area can't be blank")
        end
        it "municipalitiesが空だと登録できない" do
          @purchase_purchases_history.municipalities = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Municipalities can't be blank")
        end
        it "addressが空だと登録できない" do
          @purchase_purchases_history.address = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Address can't be blank")
        end
        it "telephone_numberが空だと登録できない" do
          @purchase_purchases_history.telephone_number = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Telephone number can't be blank")
        end
        it "telephone_numberは半角数値でないと登録できない" do
          @purchase_purchases_history.telephone_number = 'あああ'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Telephone number is invalid")
        end
        it "telephone_numberは10桁以上11桁以内でないと登録できない" do
          @purchase_purchases_history.telephone_number = '111111'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("Telephone number is invalid")
        end
        context '購入ができるとき' do
          it "postal_codeとshipping_area_id、municipalities、address、telephone_numberが存在すれば登録できる" do
            expect(@purchase_purchases_history).to be_valid
          end
        end    

      end
    end

  end


  # binding.pry

