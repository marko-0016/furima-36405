class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_user, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
  @item =  Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
   render :new
   end
  end

  def show
  end

  def edit
   end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
  end
end

  private
   def item_params
  params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :delivery_fee_id, :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
   end

   def set_user
  @item.user != current_user
  redirect_to root_path   
  end

end