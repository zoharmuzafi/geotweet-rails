# require 'will_paginate/array' .paginate(:page => 1, :limit => 10)

class TweetsController < ApplicationController
  
  def index
    streaming = Thread.new{helpers.stream()}
  end

  def search
    lat = params[:lat].to_f
    lon = params[:lon].to_f
    distance = params[:distance].to_f
    term = params[:term]
    if  (-90 < lat && lat < 90) && (-180 < lon && lon < 180) && distance > 0
      coordinates = [lon, lat]
      if params[:term] != ""
        @tweets = Tweet.full_text_search(term).geo_near({ type: "Point", coordinates: coordinates }).spherical.max_distance(distance).sort_by { |x| -x.created_at.to_f }
      else
        @tweets = Tweet.geo_near({ type: "Point", coordinates: coordinates }).spherical.max_distance(distance).sort_by { |x| -x.created_at.to_f }
      end
      render :json => { data: @tweets }
    else
      render :json => { data: 'invalid request' }, :status => 400
    end
  end
end
