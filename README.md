
## users テーブル

  |  Coliumn           |  Type      | Option    |
  |------------        |--------    |--------   |
  |nickname            |string      |null:false |
  |email               |string      |null:false |
  |password            |string      |null:false |
  |encrypted_password  |string      |null:false |
  |family_name         |string      |null:false |
  |first_name          |string      |null:false |
  |birthday            |string      |null:false |
  
  ## Association
  - has_many :items
  - has_many :purchases

<!-- 
・usersテーブルが持っている情報
ニックネーム
メールアドレス
パスワード（６文字以上）
パスワード（確認）
お名前(全角)
お名前カナ(全角)
生年月日  ここだけプルダウンして選択-->

## items テーブル

  |  Coliumn     |  Type  | Option    |
  |------------  |--------|--------   |
  |image         |        |           |
  |name          |string  |null:false |
  |introduction  |text    |null:false |
  |category      | string | null:false |
  |condition     | string | null:false |
  |delivery_fee  |text    |null:false |
  |shipping_area |text    |null:false |
  |days_to_ship  |text    |null:false |
  |price         |text    |null:false |
  |user          | references | null: false, foreign_key: true |

  ## Association
  - belongs_to :user
  - has_one :purchase

<!-- ・itemsテーブルが持っている情報
商品画像
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
  |card_information |string  |null:false |
  |date_of_expiry   |string  |null:false |
  |security_code    |string  |null:false |
  |postal_code      |string  |null:false |
  |prefectures      |string  |null:false |
  |municipalities   |string  |null:false |
  |address          |string  |null:false |
  |building_name    |string  |null:true  |
  |telephone_number |string  |null:false |
  |user             | references | null: false, foreign_key: true |
  |item             | references | null: false, foreign_key: true |

  ## Association
  - belongs_to :user
  - belongs_to :item


<!-- ・購入テーブルが持っている情報
クレジットカード情報入力という大枠（これは情報ではない）
カード情報
有効期限
セキュリティコード

配送先入力という大枠（これは情報ではない）
郵便番号 
都道府県
市区町村
番地
建物名 
電話番号 -->