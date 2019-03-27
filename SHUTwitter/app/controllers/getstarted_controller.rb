class GetstartedController < ApplicationController
  def index
  end

  def auth
	  @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
	  redirect_to(root_path)
  end

  def failure
	  redirect_to root_path, alert: "認証に失敗しました。"
  end
end
