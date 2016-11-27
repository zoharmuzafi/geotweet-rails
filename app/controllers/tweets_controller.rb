class TweetsController < ApplicationController
  
  def index
    streaming = Thread.new{helpers.stream()}
  end

  def search
    lon = params[:lon]
    lat = params[:lat]
    @tweets = Tweet.limit(10)
    render :json => { data: @tweets }
  end
end
