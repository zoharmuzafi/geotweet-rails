class Tweet
  include Mongoid::Document
  field :text, type: String
  field :location, type: Array
	index([:location, Mongo::GEO2D], {background: true})
end
