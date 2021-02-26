require 'rails_helper'

RSpec.describe 'Users::Baskets', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/users/basket/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/users/basket/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /add' do
    it 'returns http success' do
      get '/users/basket/add'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /delete' do
    it 'returns http success' do
      get '/users/basket/delete'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /clean' do
    it 'returns http success' do
      get '/users/basket/clean'
      expect(response).to have_http_status(:success)
    end
  end
end
