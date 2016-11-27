module TweetsHelper
	def stream()
  	TweetStream::Client.new.locations(-180,-90,180,90) do |tweet|
  		if tweet.geo.coordinates.class == Array
  			@new_tweet = Tweet.new(text: tweet.text, location: tweet.geo.coordinates)
  			@new_tweet.save
  		end
		end
  end
end
