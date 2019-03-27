Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter,
		ENV["CONSUMER_KEY"],
		ENV["CONSUMER_SECRET"]
	{
		:use_authorize => 'true',
	}
end

OmniAuth.config.on_failure = Proc.new do |env|
	OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end
