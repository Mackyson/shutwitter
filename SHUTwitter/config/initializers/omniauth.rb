Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter,
		"xxxxxxxxxxxxxx",
		"xxxxxxxxxxxxxxxxxxxxxxxxx",
	{
		:use_authorize => 'true',
	}
end

OmniAuth.config.on_failure = Proc.new do |env|
	OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end
