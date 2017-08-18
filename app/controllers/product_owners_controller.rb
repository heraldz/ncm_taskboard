class ProductOwnersController < ApplicationController
  # GET /product_owners
  # GET /product_owners.json
  def index
    @product_owners = ProductOwner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_owners }
    end
  end

  # GET /product_owners/1
  # GET /product_owners/1.json
  def show
    @product_owner = ProductOwner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_owner }
    end
  end

  # GET /product_owners/new
  # GET /product_owners/new.json
  def new
    @product_owner = ProductOwner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_owner }
    end
  end

  # GET /product_owners/1/edit
  def edit
    @product_owner = ProductOwner.find(params[:id])
  end

  # POST /product_owners
  # POST /product_owners.json
  def create
    @product_owner = ProductOwner.new(params[:product_owner])

    respond_to do |format|
      if @product_owner.save
        format.html { redirect_to @product_owner, notice: 'Product owner was successfully created.' }
        format.json { render json: @product_owner, status: :created, location: @product_owner }
      else
        format.html { render action: "new" }
        format.json { render json: @product_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_owners/1
  # PUT /product_owners/1.json
  def update
    @product_owner = ProductOwner.find(params[:id])

    respond_to do |format|
      if @product_owner.update_attributes(params[:product_owner])
        format.html { redirect_to @product_owner, notice: 'Product owner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_owners/1
  # DELETE /product_owners/1.json
  def destroy
    @product_owner = ProductOwner.find(params[:id])
    @product_owner.destroy

    respond_to do |format|
      format.html { redirect_to product_owners_url }
      format.json { head :no_content }
    end
  end
end
