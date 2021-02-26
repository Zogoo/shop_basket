class HomeController < ApplicationController
  protect_from_forgery with: :null_session

  def index; end

  def all
    categories = Category.all
    products = JSON.parse(Product.all.to_json(include: :product_image))
    basket = Basket.new
    render json: { categories: categories, products: products, basket: basket }
  end

  def search
    products = Product.search_by_keyword(search_params)
    render json: { products: products }
  end

  def category; end

  def suggestion; end

  private

  def search_params
    params.permit(:keyword).require(:keyword)
  end
end
