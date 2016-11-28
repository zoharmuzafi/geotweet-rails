class Tweet
  include Mongoid::Document
  field :text, type: String
  field :created_at, :type => DateTime
  field :location, type: Array
  
	index({ location: "2dsphere" }, { min: -200, max: 200 })
end
