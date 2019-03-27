class GetstartedController < ApplicationController
  def index
  end

  def auth
	  @user = request.env['omniauth.auth']
	  cookies[:uid] = { value:@user[:uid], expires: 5.minute.from_now}
	  cookies[:token] = { value:@user[:credentials][:token], expires: 5.minute.from_now}
	  cookies[:token_secret] = { value:@user[:credentials][:secret], expires: 5.minute.from_now}
	  redirect_to "/block/index"
  end

  def failure
	  redirect_to root_path, alert: "認証に失敗しました。"
  end
end
