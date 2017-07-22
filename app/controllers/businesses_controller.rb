class BusinessesController < ApplicationController
	before_action :find_business, only: [:show, :edit, :update, :destroy]
	before_action :set_upload, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index 
		if params[:category].blank?
			@businesses = Business.all
		else
			@category_id = Category.find_by(name: params[:category]).id
			@businesses = Business.where(:category_id => @category_id)
		end
	end 
	def show
		if @business.likes.blank?
			@average_like = 0

		else
			@average_like = @business.likes.average(:rating).round(2)
		end

	end
	def edit
		
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end
	def update
		@business = Business.find(params[:id])
		@business.category_id = params[:category_id]
        @business.update(business_params)
        redirect_to @business
    end

	def new 
		@business = current_user.businesses.build
		@categories = Category.all.map{ |c| [c.name, c.id] } 
	end 

	def create 
		@business = current_user.businesses.build(business_params)
		@business.category_id = params[:category_id]

		if @business.save
			redirect_to root_path
		else

		render 'new'
		end
	end 

	def destroy
		
        @business.destroy
        redirect_to businesses_path

	end

	private 
    def set_upload
      @Business = Business.find(params[:id])
    end
 
	def business_params
		params.require(:business).permit(:name, :logo, :description, :university, :location, :video, :category_id)
	end

	def find_business
		@business = Business.find(params[:id])

	end



end
