class SessionsController < ApplicationController
  def index
  end

  def create
	  session[:user_id] = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
	  redirect_to(root_path)
  end
end
