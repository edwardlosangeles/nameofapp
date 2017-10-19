class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index

    # ED 20170918 search form
    #original contents of index was just this one line
    #@products = Product.all
    
    #if there was an argument passed, then show page based on it
    #otherwise show page with all products
    if params[:q]
      search_term = params[:q]
      #return filtered list here
      #add search method in product model since it's not good practice run queries in controller
      # app/models/product.rb
      @products = Product.search(search_term)
    else
      @products = Product.all
    end    
    #remember, associated view, index.html.erb, is rendered after index action finishes
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # 20171017 5.8 Comments Controller & Views
    @comments = @product.comments.order("created_at DESC")
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save

        #ED 20170915 just for 5.1, I changed original redirect page from single product to product index
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        #format.html { redirect_to @product, notice: 'Product was successfully created.' }
        
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color, :price)
    end
end
