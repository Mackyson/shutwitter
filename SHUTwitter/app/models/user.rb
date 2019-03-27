class User < ApplicationRecord
	def self.find_or_create_from_auth_hash(auth_hash)
		provider = auth_hash[:provider]
		uid = auth_hash[:uid]
		token = auth_hash[:credentials][:token]
		token_secret = auth_hash[:credentials][:secret]
		self.find_or_create_by(
								provider: provider,
								uid: uid,
								token: token,
								token_secret: token_secret
		)
	end
end
