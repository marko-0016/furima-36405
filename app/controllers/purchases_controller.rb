class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    binding.pry
    @purchase_purchases_history = PurchasePurchasesHistory.new
    @item = Item.find(params[:item_id])
    
     if @item.user == current_user
         redirect_to root_path
    end
  end

 def create
        @item = Item.find(params[:item_id])
       @purchase_purchases_history = PurchasePurchasesHistory.new(purchase_purchases_history_params)
   if  @purchase_purchases_history.valid?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_purchases_history_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
       @purchase_purchases_history.save
       redirect_to root_path
    else
      render :index 
    end
 end

  private
  def purchase_purchases_history_params
 params.require(:purchase_purchases_history).permit(:postal_code, :shipping_area_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
end