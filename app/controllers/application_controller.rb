class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


 private
 def configure_permitted_parameters  

    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:family_name,:first_name,:family_name_katakana,:first_name_katakana,:birthday])
 end
end

# keysにパスワードは不要？
# |encrypted_password  



# フリマアプリ基本機能だけの場合はユーザーズコントローラーは作成しない。
# 追加機能でユーザー詳細などを作る場合は生成する