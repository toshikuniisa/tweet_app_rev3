class ApplicationController < ActionController::Base


  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end

 def after_sign_in_path_for(resource)
   posts_path
 end
end
