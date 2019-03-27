class SuperController < ApplicationController
	protect_from_forgery
	help_method :current_user

	protected
	def require_login
		@current_user = determine_user
		unless @current_user
			redirect_to root_path, alert: "認証に失敗しました。"
		end
	end

	def determine_user
		@current_user ||= SessionUser.new(session) if session[:uid]
	end
