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
    if keyword_param.present?
      products = Product.search_by_keyword(keyword_param)
    elsif category_param.present?
      categories = Category.search_by_name(category_param)
      products = Product.where(category: categories)
    end
    render json: { products: products }
  end

  def category; end

  def suggestion; end

  private

  def keyword_param
    params.permit(:keyword).dig(:keyword)
  end

  def category_param
    params.permit(:category).dig(:category)
  end
end
