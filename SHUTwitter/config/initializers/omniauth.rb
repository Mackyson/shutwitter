Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter,
		"xxxxxxxxxxxxxx",
		"xxxxxxxxxxxxxxxxxxxxxxxxx",
	{
		:use_authorize => 'true',
	}
end
