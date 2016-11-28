class TweetsController < ApplicationController
  
  def index
    streaming = Thread.new{helpers.stream()}
  end

  def search
    if  (-90 < params[:lat].to_f && params[:lat].to_f < 90) && 
      (-180 < params[:lon].to_f && params[:lon].to_f < 180) && 
      params[:distance].to_f > 0
      coordinates = [params[:lat].to_f, params[:lon].to_f]
      puts coordinates
      # @tweets = Tweet.where(:location => {'$nearSphere' => coordinates }).sort(:created_at.desc)
      @tweets = Tweet.geo_near({ type: "Point", coordinates: coordinates }).spherical.max_distance(params[:distance].to_f).sort_by { |x| -x.created_at.to_f }
      render :json => { data: @tweets }
    else
      render :json => { data: 'invalid request' }, :status => 400
    end
  end
end
