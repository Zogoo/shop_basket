class HomeController < ApplicationController
  def index
  end

  def all
    categories = Category.all
    products = Product.all
    basket = Basket.new
    render json: { categories: categories, products: products, basket: basket}
  end

  def search
  end

  def category
  end

  def suggestion
  end
end
