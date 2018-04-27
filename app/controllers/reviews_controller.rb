class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save

    redirect_to @product

  end

  def destroy
    @review = Review.find params[:id]
    @product = @review.product
    if @review.user == current_user
      @review.destroy
    end

    redirect_to product_path(@product)
  end

  private

    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
