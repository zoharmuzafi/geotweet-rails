class TweetsController < ApplicationController
  def index
    streaming = Thread.new{helpers.stream()}
  end
end
