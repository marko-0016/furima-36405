
## users テーブル

  |  Coliumn           |  Type      | Option    |
  |------------        |--------    |--------   |
  |nickname            |string      |null:false |
  |email               |string      |unique: true |
  |encrypted_password  |string      |null:false |
  |family_name         |string      |null:false |
  |first_name          |string      |null:false |
  |family_name_katakana         |string      |null:false |
  |first_name_katakana          |string      |null:false |
  |birthday            |date    |null:false|
  
  ## Association
  - has_many :items
  - has_many :purchases

<!-- 
・usersテーブルが持っている情報
ニックネーム
メールアドレス
パスワード（６文字以上）→passwordカラムは削除。deviseのgemがあらかじめ用意しているencrypted_passwordを使用しているため。
パスワード（確認）
お名前(全角)
お名前カナ(全角)
生年月日  ここだけプルダウンして選択-->

## items テーブル

  |  Coliumn        |  Type     | Option    |
  |------------     |--------   |--------   |
  |name             |string     |null:false |
  |introduction     |text       |null:false |
  |category_id      |integer    | null:false |
  |condition_id     |integer    | null:false |
  |delivery_fee_id  |integer    |null:false |
  |shipping_area_id |integer    |null:false |
  |days_to_ship_id  |integer    |null:false |
  |price            |integer       |null:false |
  |user             | references| null: false, foreign_key: true |

  ## Association
  - belongs_to :user
  - has_one :purchase
  

<!-- ・itemsテーブルが持っている情報
商品画像→「active_storage」を使用するため、設計の段階から削除（理由はactive_storage導入時に自動でテーブルが生成されるからです）
商品名（４０文字まで）
商品の説明（１０００文字まで）

商品の詳細という大枠（これは情報ではない）
カテゴリー
商品の状態

配送についてという大枠（これは情報ではない）
配送料の負担
発送元の地域
発送までの日数 

販売価格という大枠（これは情報ではない）
価格　（価格を埋めれば自動的に販売手数料、利益入る仕組みユーザー自身は入力しない）
-->

## purchases テーブル

  |  Coliumn        |Type    | Option    |
  |------------     |--------|--------   |
  |date_of_expiry   |string  |null:false |
  |security_code    |string  |null:false |
  |postal_code      |string  |null:false |
  |shipping_area_id      |string  |null:false |
  |municipalities   |string  |null:false |
  |address          |string  |null:false |
  |building_name    |string  |           |
  |telephone_number |string  |null:false |
  |order             | references | null: false, foreign_key: true |
  
  ## Association
  - belongs_to :user
  - belongs_to :item
  - has_one    :purchase history


<!-- 
・購入テーブルが持っている情報
クレジットカード情報入力という大枠（これは情報ではない）
カード情報→セキュリティの観点からデータベースに入れることができないため削除
有効期限
セキュリティコード

配送先入力という大枠（これは情報ではない）
郵便番号 
都道府県
市区町村
番地
建物名 →任意入力なのでオプションの箇所は空欄にした
電話番号
 -->

 ## purchases_historys テーブル

  |  Coliumn        |Type    | Option    |
  |------------     |--------|--------   |
  |user             | references | null: false, foreign_key: true |
  |item             | references | null: false, foreign_key: true |

  ## Association
  - belongs_to :purchase