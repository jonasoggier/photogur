class PicturesController < ApplicationController
	
	def index
		if params[:copyrighted] == "true" # /pictures?copyrighted=true
			@pictures = Picture.where(:copyrighted => true).alphabetical.all
		else
			@pictures = Picture.alphabetical.all
		end
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create  		
		@picture = Picture.new(params[:picture])  
		if @picture.save # returns true or false 
			redirect_to pictures_path
		else
			flash.now[:error] = "Could not save the picture. Pls try again."
			render :new  # render goes to controller and renders VIEW for #new action (without running the code in PicturesController#new!!) => keep existing data in form
		end
	end

	def edit
		@picture = Picture.find(params[:id])   
	end

	def update  # no saving necessary as update_attributes does this already
		@picture = Picture.find(params[:id])  # see comments below
		if @picture.update_attributes(params[:picture])  # see comments below
			redirect_to @picture  # alternatively: 'redirect_to picture_path(@picture)'
		else
			# do something else
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to pictures_path
	end

end


# This is what the params looks like after submitting the form

# params = {
# 	:id => "2"
# 	:picture => {
# 		:title => "some title"
# 		:artist => "some artist"
# 		:url => "some url"
# 	}
# }