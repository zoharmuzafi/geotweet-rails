class TweetsController < ApplicationController
  
  def index
    streaming = Thread.new{helpers.stream()}
  end

  def search
    lon = params[:lon]
    lat = params[:lat]
    @tweets = Tweet.all
    render :json => { data: @tweets }
  end
end

