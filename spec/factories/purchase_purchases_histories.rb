FactoryBot.define do
  factory :purchase_purchases_history do
    postal_code           {"573-0049"}
    shipping_area_id      {1}
    municipalities        {"大阪市"}
    address               {"青山1-1"}
    telephone_number      {"09012345678"}
    token                 {"tok_2d9ceb4a4ab725fe89cb0c1958b5"}
    building_name         {"なんばスカイオ"}


  end
end


# 配送先の住所情報も購入の都度入力させること。
# 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
# 建物名は任意であること。
# 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。
