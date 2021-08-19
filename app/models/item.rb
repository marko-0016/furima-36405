class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id,  numericality: { other_than: 1 , message: "can't be blank"}
    # :condition_id,:delivery_fee_id,:shipping_area_id,:days_to_ship_id,
    #  ↑これをバリデーション設定したらDBに保存できなくなる

  with_options presence: true do
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
    validates :user_id
 end

 has_one_attached :image

end

  #  Association
  # belongs_to :user
  # has_one :purchase_history


