class BlockController < ApplicationController
	before_action :twitter_client
  def index
  end

  def blocking
	  @blocktarget_list = search_blocktarget_list(@client)
	  p @blocktarget_list
	  for target in @blocktarget_list do
		  @client.block(target)
		  sleep(0.01)
	  end
	  sleep(0.1)
	  for target in @blocktarget_list do
		  @client.unblock(target)
		  sleep(0.01)
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
	  following_list = user.friend_ids(count: 200)
	  is_following = Hash.new
	  blocktarget_list = Array.new
	  for following in following_list do
		  is_following[following] = true
	  end
	  for follower in followers_list do
		  unless is_following[follower]
			  blocktarget_list << follower
		  end
	  end
	  blocktarget_list
  end

end
