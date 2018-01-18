class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :isadmin, only: [:new, :edit, :destroy]

  # GET /products
  # GET /products.json
  def index
    
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term).paginate(:page => params[:page], :per_page => 6)
    else
      @products = Product.all.paginate(:page => params[:page], :per_page => 6)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    @product.viewed!
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
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
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

    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color, :price_in_cents, :image_thumb)
    end

    def isadmin
      if !current_user.admin?
        redirect_to root_path, alert: 'Not authorized to access this page'
      end
    end

end
