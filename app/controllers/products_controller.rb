class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #20171210 6.8 Security
  #authenticate user first to make sure there is someone logged in just so if statement in isadmin won't throw an error
  #because is admin checks if current user is logged in. If there is no user logged in, then !current_user.admin? is unidentified
  before_action :authenticate_user!, only: [:edit]
  before_action :isadmin, only: [:edit]

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
      # @products = Product.search(search_term)

      #20171022 5.9 Validation & Pagination
      #only allow 6 products per page
      # original
      #@products = Product.search(search_term)
      @products = Product.search(search_term).paginate(:page => params[:page], :per_page => 6)

    else

      #20171022 5.9 Validation & Pagination
      #only allow 6 products per page
      # original
      #@products = Product.all
      @products = Product.all.paginate(:page => params[:page], :per_page => 6)

    end    
    #remember, associated view, index.html.erb, is rendered after index action finishes
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # 20171017 5.8 Comments Controller & Views
    #@comments = @product.comments.order("created_at DESC")

    #20171022 5.9 Validation & Pagination
    #only allow 5 comments per page
    @comments = @product.comments.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")

    # 20171222 6.12: Redis & Performance Strategy
    # @product.viewed!

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
      # 20171124 6.5: Payment Forms with Stripe
      # original
      # params.require(:product).permit(:name, :description, :image_url, :color, :price
      # 20171213 6.9: JavaScript on Rails added :image_thumb
      params.require(:product).permit(:name, :description, :image_url, :color, :price_in_cents, :image_thumb)
    end

    #20171210 6.8 Security
    def isadmin
      if !current_user.admin?
        redirect_to root_path, alert: 'Not authorized to access this page'
      end
    end

end
