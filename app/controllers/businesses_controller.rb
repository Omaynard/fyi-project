class BusinessesController < ApplicationController
	def index 
		if params[:category].blank?
			@businesses = Business.all
		else
			@category_id = Category.find_by(name: params[:category]).id
			@businesses = Business.where(:category_id => @category_id)
		end
	end 
	def show
		@business = Business.find(params[:id])
		@likes = @business.likes
	end
	def edit
		@business = Business.find(params[:id])
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end
	def update
		@business = Business.find(params[:id])
		@business.category_id = params[:category_id]
        @business.update(business_params)
        redirect_to @business
    end

	def new 
		@business = Business.new
		@categories = Category.all.map{ |c| [c.name, c.id] } 
	end 

	def create 
		@business = Business.create(business_params)
		@business.category_id = params[:category_id]
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
		params.require(:business).permit(:name, :logo, :description, :university, :location, :video, :category_id)
	end



end
