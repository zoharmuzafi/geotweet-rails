module TweetsHelper
	def stream()
  	TweetStream::Client.new.locations(-180,-90,180,90) do |tweet|
  		puts tweet
		end
  end
end
