class DiscountGroupsController < ApplicationController
  # GET /discount_groups
  # GET /discount_groups.json
  def index
    @discount_groups = DiscountGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discount_groups }
    end
  end

  # GET /discount_groups/1
  # GET /discount_groups/1.json
  def show
    @discount_group = DiscountGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discount_group }
    end
  end

  # GET /discount_groups/new
  # GET /discount_groups/new.json
  def new
    @discount_group = DiscountGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discount_group }
    end
  end

  # GET /discount_groups/1/edit
  def edit
    @discount_group = DiscountGroup.find(params[:id])
  end

  # POST /discount_groups
  # POST /discount_groups.json
  def create
    @discount_group = DiscountGroup.new(params[:discount_group])

    respond_to do |format|
      if @discount_group.save
        format.html { redirect_to @discount_group, notice: 'Discount group was successfully created.' }
        format.json { render json: @discount_group, status: :created, location: @discount_group }
      else
        format.html { render action: "new" }
        format.json { render json: @discount_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discount_groups/1
  # PUT /discount_groups/1.json
  def update
    @discount_group = DiscountGroup.find(params[:id])

    respond_to do |format|
      if @discount_group.update_attributes(params[:discount_group])
        format.html { redirect_to @discount_group, notice: 'Discount group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discount_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_groups/1
  # DELETE /discount_groups/1.json
  def destroy
    @discount_group = DiscountGroup.find(params[:id])
    @discount_group.destroy

    respond_to do |format|
      format.html { redirect_to discount_groups_url }
      format.json { head :no_content }
    end
  end
end
