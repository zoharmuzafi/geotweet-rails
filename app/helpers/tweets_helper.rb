module TweetsHelper
	def stream()
  	TweetStream::Client.new.locations(-180,-90,180,90) do |tweet|
  		puts tweet.geo.coordinates
  		if tweet.geo.coordinates.class == Array
  			@new_tweet = Tweet.new(text: tweet.text, location: tweet.geo.coordinates, created_at: tweet.created_at)
  			@new_tweet.save
  		end
		end
  end
end
