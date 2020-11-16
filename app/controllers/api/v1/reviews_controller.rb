class Api::V1::ReviewsController < ApplicationController

  def index
   @reviews = Review.all
   
   render json: @reviews
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    review = Review.new(review_params)
    review.recipe = recipe
    review.user = current_user

    if review.save
      render json: { review: review, info: "Thanks for Sharing!" }
    else
      render json: { error: review.errors.full_messages },status: 400
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :thoughts, :suggested_edits)
  end
end
