class RatingsController < ApplicationController
  # POST /ratings
  # POST /ratings.json
  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.build(:user_id => params[:user_id], :value => params[:value])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating.product, notice: "Rating for #{product} was successfully created." }
        format.json { render json: @rating, status: :created, location: @rating }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end
end
