class BeersController < ApplicationController


	# List all of the beers
	def index
		@beers = Beer.all
	end

	# Show data for one beer
	def show
		@beer = Beer.find(params[:id])
	end

	# Displays form for creating a new beer
	def new
		@beer = Beer.new
	end

	# Processes data form the new beer form and creates a beer
	def create
		@beer = Beer.new(params[:beer])
		if @beer.save
		redirect_to @beers
	else
		render 'new'
	end
		redirect_to @beers
	end

	# Displays form for editing an existing beer
	def edit 

	end

	# Processes data form the edit beer form and updates a beer
	def update

	end

	# Deletes the beer
	def destroy
		Beer.find(params[:id]).destroy
	end
end
