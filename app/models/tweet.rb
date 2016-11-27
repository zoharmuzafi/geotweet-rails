class Tweet
  include Mongoid::Document
  field :text, type: String
  field :location, type: Array
  
	index({ location: "2d" }, { min: -200, max: 200 })
end
