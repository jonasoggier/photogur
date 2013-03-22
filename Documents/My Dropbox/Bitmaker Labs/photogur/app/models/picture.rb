class Picture < ActiveRecord::Base
	attr_accessible :title, :artist, :url

	validates :title, :presence => true
	validates :artist, :presence => true
	validates :url, {
		:presence => true,
		:format => {
			:with => /^https?:/, :message => "Please enter a valid URL"
		}
	}
end