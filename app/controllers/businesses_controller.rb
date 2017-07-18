class BusinessesController < ApplicationController
	def index 
		@businesses = Business.all
	end 
	def show
		@business = Business.find(params[:id])
	end
	def edit
		@business = Business.find(params[:id])
	end
	def update
		@business = Business.find(params[:id])
        @business.update(business_params)
        redirect_to @business
    end

	def new 
		@business = Business.new
	end 

	def create 
		@business = Business.create(business_params)
		@business.user_id = current_user.id
		@business.save
		redirect_to
	end 

	private 
	def business_params
		params.require(:business).permit(:name, :logo, :description, :university, :location, :video)
	end



end
