class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.order(created_at: :desc)
    @review = Review.new
    if session[:review_errors]
      session[:review_errors].each { |error, error_message| @review.errors.add error, error_message }
      session.delete :review_errors
    end
  end

end
