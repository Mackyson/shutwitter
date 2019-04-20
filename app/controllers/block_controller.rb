class BlockController < ApplicationController
	before_action :twitter_client
  def index
  end

  def blocking
	  cnt=0
	  @blocktarget_list = search_blocktarget_list(@client)
	  for target in @blocktarget_list do
		  @client.block(target)
		  sleep(0.1)
	  end
	  sleep(1)
	  for target in @blocktarget_list do
		  @client.unblock(target)
		  cnt++
		  sleep(0.1)
	  end
	  @shutMessage=
		  if (cnt==0)
			"SHUT対象はいませんでした。"
		  else
			cnt.to_s() << "人をSHUTしました。"
		  end
  end
  private
  def twitter_client
	  @client = Twitter::REST::Client.new do |config|
		  config.consumer_key = ENV['CONSUMER_KEY']
		  config.consumer_secret = ENV['CONSUMER_SECRET']
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
