class Tweet
  include Mongoid::Document
  include Mongoid::Search

  field :text, type: String
  field :created_at, :type => DateTime
  field :location, type: Array
  
	search_in :text

	index({ location: "2dsphere" }, { min: -200, max: 200 })
end
