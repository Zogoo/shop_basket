class Api::V1::BasketController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    basket = if user_signed_in?
      current_user.baskets.all
    else
      []
    end
    render json: { basket: basket }
  end

  def create; end

  def add; end

  def delete; end

  def clean; end
end
