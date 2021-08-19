class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id,:condition_id,:delivery_fee_id,:shipping_area_id,:days_to_ship_id, numericality: { other_than: 0 , message: "can't be blank"}

  with_options presence: true do
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
 end

end

  #  Association
  # has_one :purchase_history


