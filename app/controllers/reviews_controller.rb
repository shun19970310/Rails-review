class ReviewsController < ApplicationController
  def index
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to ramen_shop_reviews_path(@review.ramen_shop)
    else
      @ramen_shop = RamenShop.find(params[:id])
      # ramen_shopsコントローラに定義されている@ramen_shop = RamenShop.find(params[:id])をcreateアクション内に記述する必要がある（renderを使うとき）
      render "ramen_shops/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:ramen_shop_id, :score, :content)
  end
end
