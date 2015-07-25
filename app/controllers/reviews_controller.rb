class ReviewsController < ApplicationController
  before_action :find_peluqueria 
  before_action :authenticate_user!
  
  def create
    @review = @peluqueria.reviews.new(reviews_params)
    @review.user = current_user
    @review.picture.user_id = current_user.id if @review.picture
    # @review.user_id = current_user.id
    if @review.save
      redirect_to @peluqueria
    else 
      redirect_to @peluqueria, notice: "Tu review no se ha guardado. Intenta otra vez" 
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
    params.require(:review).permit(:title, :body, :pelu_rating, :user_id, picture_attributes: picture_attributes)
  end
  def find_peluqueria
    @peluqueria = Peluqueria.find(params[:peluqueria_id])
  end  
end
