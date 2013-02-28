class RatingsController < ApplicationController
  # POST /ratings
  # POST /ratings.json
  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.build(:user_id => params[:user_id], :value => params[:value])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to category_product_path(@rating.product.category, @rating.product), notice: "Rating for #{@rating.product} was successfully created." }
      else
        format.html { render action: "new" }
      end
    end
  end
end
