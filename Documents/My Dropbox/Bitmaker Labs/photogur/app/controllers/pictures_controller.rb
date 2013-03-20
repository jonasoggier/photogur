class PicturesController < ApplicationController
	
	def index
		@pictures = Picture.all   #returns a collection (in the form of an array) of pictures (which are instances of the Picture class)
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
	end

	def create  # we could use the same notation as for the 'update' method below
		@picture = Picture.new
		@picture.title = params[:title]
		@picture.artist = params[:artist]
		@picture.url = params[:url]
		success = @picture.save
		if success
			redirect_to pictures_path
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update  # no saving necessary as update_attributes does this already
		@picture = Picture.find(params[:id])
		@picture.update_attributes(:title => params[:title], :artist => params[:artist], :url => params[:url])
		redirect_to pictures_path
	end

end

