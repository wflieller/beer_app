class BeersController < ApplicationController
before_action :set_beer, only: [:show, :edit, :update, :destroy]


	# List all of the beers
	def index
		@beers = Beer.all
	end

	# Show data for one beer
	def show

	end

	# Displays form for creating a new beer
	def new
		@beer = Beer.new
	end

	# Processes data form the new beer form and creates a beer
	def create
		@beer = Beer.new(beer_params)

		respond_to do |format|
	      if @beer.save
	        format.html { redirect_to beers_url, notice: 'A new beer was successfully created.' }
	        format.json { render :show, status: :created, location: @beer }
	      else
	        format.html { render :new }
	        format.json { render json: @beer.errors, status: :unprocessable_entity }
	      end
	    end
	end

	# Displays form for editing an existing beer
	def edit 

	end

	# Processes data form the edit beer form and updates a beer
	def update
		respond_to do |format|
	      if @beer.update(beer_params)
	        format.html { redirect_to beers_url, notice: 'That beer has successfully been updated.' }
	        format.json { render :show, status: :ok, location: @beer }
	      else
	        format.html { render :edit }
	        format.json { render json: @beer.errors, status: :unprocessable_entity }
	      end
    	end
	end

	# Deletes the beer
	def destroy
		@beer.destroy
		    respond_to do |format|
		      format.html { redirect_to beers_url, notice: 'That beer was successfully destroyed.' }
		      format.json { head :no_content }
		    end
	end

	private
  	def set_beer
      @beer = Beer.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:name, :brewer, :beer_type, :abv)
    end
end
