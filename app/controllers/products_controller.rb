class ProductsController < ApplicationController
  def index
    @categories = Category.all
    
    cate = params[:cate]
    if !cate.nil?
      @products = Product.where(:category_id => cate)
    else
      @products = Product.all
    end

  
  end

  def show
    @product = Product.find(params[:id])
 
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully added"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to :action => :index, notice: "Product was successfully destroyed."
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
