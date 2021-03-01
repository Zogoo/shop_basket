class Api::V1::ProductsController < ApplicationController
  def all
    categories = Category.all
    products = JSON.parse(Product.all.to_json(include: :product_image))
    basket = Basket.all
    render json: { categories: categories, products: products, basket: basket }
  end

  def search
    if keyword_param.present?
      products = JSON.parse(Product.search_by_keyword(keyword_param).to_json(include: :product_image))
    elsif category_param.present?
      categories = Category.search_by_name(category_param)
      products = JSON.parse(Product.where(category: categories).to_json(include: :product_image))
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
