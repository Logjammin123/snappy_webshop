class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    if params['category_id'] && Category.where(:id => params['category_id']).any?
      @category = Category.where(:id => params['category_id']).first
      @products = @category.products
      spread_breadcrumbs
    else
      @products = Product.limit(25)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    if params['category_id'] && Category.where(:id => params['category_id']).any?
      @category = Category.where(:id => params['category_id']).first
    end
    @product = Product.find(params[:id])
    spread_breadcrumbs

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    spread_breadcrumbs

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    spread_breadcrumbs
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    spread_breadcrumbs

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
  def spread_breadcrumbs
    if @category
      add_breadcrumb 'Listing categories', categories_path
      add_breadcrumb @category, @category
      add_breadcrumb "Listing products of the category #{@category}", category_products_path(@category)
      if @product && !@product.new_record?
        add_breadcrumb @product, category_product_path(@category, @product)
      end
    else
      add_breadcrumb 'Listing products', root_path
      if @product && !@product.new_record?
        add_breadcrumb @product, @product
      end
    end

  end

end
