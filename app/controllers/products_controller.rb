class ProductsController < ApplicationController

  def index
    @products = Product.limit(4).order("created_at desc")
  end

  def new
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

  def detail
    @product = Product.find(params[:id])
    @product_user = Product.find_by(user_id: params[:user_id])
    @category_id = Category.find(@product.category_id)
    @category_child_id = Category.find(@category_id.parent_id)
    @category_parent_id = Category.find(@category_child_id.parent_id)
    @image = Image.find(params[:id])
    @review_good = Review.where(rate: 0).count
    @review_nomal = Review.where(rate: 1).count
    @review_bad = Review.where(rate: 2).count
    @user = User.find(params[:id])
    @like = Like.new
    @likes_count = Like.where(product_id: @product.id).count
    @after_item = Product.order("RAND()").first
    @before_item = Product.order("RAND()").last
  end

  def confirmation
  end
end
