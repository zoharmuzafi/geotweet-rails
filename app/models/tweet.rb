class Tweet
  include Mongoid::Document
  field :text, type: String
  field :created_at, :type => DateTime
  field :location, type: Array
  
	index({ location: "2dsphere" }, { min: -180, max: 180 })
end
