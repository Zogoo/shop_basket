class Api::V1::OrderController < ApplicationController
  # before_action :authenticate_user!

  def add
    products = Product.where(id: new_order_params)
    product_counts = new_order_params.tally
    ActiveRecord::Base.transaction do
      products.each do |product|
        Order.create!(product: product, user: User.first, count: product_counts[product.id])
      end
    end

    render json: { message: 'Order successfully done' }
  rescue => e
    render json: { message: e.full_message }, status: 400
  end

  def show
  end

  def all
  end

  def cancel
  end

  private

  def new_order_params
    params.required(:product_ids)
  end
end
