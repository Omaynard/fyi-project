class BusinessesController < ApplicationController
	def index 
		@businesses = Business.all
	end 
	def show
		@business = Business.find(params[:id])
	end
	def edit
		@business = Business.find(params[:id])
		@catergories = Catergory.all.map{ |c| [c.name, c.id] }
	end
	def update
		@business = Business.find(params[:id])
		@business.catergory_id = params[:catergory_id]
        @business.update(business_params)
        redirect_to @business
    end

	def new 
		@business = Business.new
		@catergories = Catergory.all.map{ |c| [c.name, c.id] } 
	end 

	def create 
		@business = Business.create(business_params)
		@business.catergory_id = params[:catergory_id]
		@business.user_id = current_user.id
		@business.save
		redirect_to
	end 
	def destroy
		@business = Business.find(params[:id])
        @business.destroy
        redirect_to businesses_path

	end

	private 
	def business_params
		params.require(:business).permit(:name, :logo, :description, :university, :location, :video, :catergory_id)
	end



end
