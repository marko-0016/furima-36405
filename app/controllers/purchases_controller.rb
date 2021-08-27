class PurchasesController < ApplicationController

  def index
    @purchase_purchases_history = PurchasePurchasesHistory.new
    @item = Item.find(params[:item_id])
  end

 def create
       @item = Item.find(params[:item_id])
       @purchase_purchases_history = PurchasePurchasesHistory.new(purchase_purchases_history_params)
   if  @purchase_purchases_history.valid?
       @purchase_purchases_history.save
       redirect_to root_path
    else
      render :index 
    end
 end

  private
  def purchase_purchases_history_params
 params.require(:purchase_purchases_history).permit(:postal_code, :shipping_area_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

#binding.pry