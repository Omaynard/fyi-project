class LikesController < ApplicationController
  
  
  def new
    @like = Like.new
  end

 

  
  def create
    @like = Like.new(like_params)
  end
  private like_params
  params.require(:like).permit(:rating, :comment)
end

  
  

 