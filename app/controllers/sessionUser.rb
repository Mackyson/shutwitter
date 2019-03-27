class SessionUser
	def initialize(session)
		@uid = session[:uid]
		@token = session[:token]
		@token_secret = session[:token_secret]
	end
end
