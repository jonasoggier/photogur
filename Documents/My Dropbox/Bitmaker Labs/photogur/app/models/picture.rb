class Picture < ActiveRecord::Base
	attr_accessible :title, :artist, :url, :copyrighted

	validates :title, :presence => true
	validates :artist, :presence => true
	validates :url, {
		:format => {
			:with => /^https?:/, :message => "Please enter a valid URL"
		}
	}

	scope :alphabetical, order("title ASC")
end