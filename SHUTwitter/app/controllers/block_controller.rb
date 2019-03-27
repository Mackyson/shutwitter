class BlockController < ApplicationController
	before_action :twitter_client
  def index
  end

  def blocking
	  @blocktarget_list = search_blocktarget_list(@client)
	  for target in @blocktarget_list do
		  @client.block(target)
		  @client.unblock(target)
	  end
  end
  private
  def twitter_client
	  @client = Twitter::REST::Client.new do |config|
		  config.consumer_key = Rails.application.secrets.twitter_api_key
		  config.consumer_secret = Rails.application.secrets.twitter_api_secret
		  config.access_token = cookies[:token]
		  config.access_token_secret = cookies[:token_secret]
	  end
	end
  def search_blocktarget_list(user)
	  followers_list = user.follower_ids(count: 200)
	  following_list = user.friend_ids
	  is_following = {}
	  blocktarget_list = []
	  for following in following_list do
		  is_following[following] = true;
	  end
	  for follower in followers_list do
		  unless is_following[follower]
			  blocktarget_list << follower
		  end
	  end
  end

end
