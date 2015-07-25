class ReviewsController < ApplicationController
  before_action :find_peluqueria 
  before_action :authenticate_user!
  
  def create
    @review = @peluqueria.reviews.new(reviews_params)
    if @review.save
      redirect_to :back
    else 
      redirect_to :back, notice: "Tu review no se ha guardado. Intenta otra vez" 
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def reviews_params
    picture_attributes = [:id, :caption, :photo, :user_id]
    params.require(:review).permit(:title, :body, :pelu_rating, picture_attributes: picture_attributes)
  end
  def find_peluqueria
    @peluqueria = Peluqueria.find(params[:peluqueria_id])
  end  
end
