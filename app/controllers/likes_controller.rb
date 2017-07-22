class LikesController < ApplicationController
	before_action :find_business
	before_action :find_like, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

  
  
  def new
    @like = Like.new
  end

 

  
  def create
    @like = Like.new(like_params)
    @like.business_id = @business.id
    @like.user_id = current_user.id
    if @like.save
    	redirect_to business_path(@business)
    else
    	render 'new'
    end
  end
  
  def edit
  	

  end 

  def update
  	@like = Like.find(params[:id])
  	if @like.update(like_params)
  		redirect_to business_path(@business)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@like.destroy
  	redirect_to business_path(@business)
  end
  private 
  def like_params
  params.require(:like).permit(:rating, :comment)
	end
	def find_business
		@business = Business.find(params[:business_id])
	end
	def find_like
		@like = Like.find(params[:id])

	end
end

  
  

 