class ProductsController < ApplicationController

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
    @product = current_user.products.new
    @image = Image.new
    @categories = Category.where("parent_id= '0'")
    @categories = @categories.map{|a| [a[:name], a[:id]] }
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @image = Image.new(image_params)
        if @image.save
          redirect_to action: :index
        end
    end
  end

  def search_category
    @child_categories = Category.where(("parent_id= #{params[:id]}"))
    @child_categories = @child_categories.map{|a| [a[:name], a[:id]]}
    respond_to do |format|
      format.json
    end
  end

  private
  def product_params
    binding.pry
    params.require(:product).permit(:name, :detail, :status, :delivery_fee, :area, :shipping_dates, :price, :delivery_status, :user_id, :brand_id, :category_id)
  end

  def image_params
    params.require(:image).permit(image: []).merge(product_id: @product.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    products = Product.find(params[:id])
    if products.destroy
       redirect_to root_path
    else
      render :show
    end
  end


  def confirmation
  end
end
