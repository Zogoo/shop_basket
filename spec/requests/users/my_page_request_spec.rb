require 'rails_helper'

RSpec.describe 'Users::MyPages', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/my_page/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /checked' do
    it 'returns http success' do
      get '/users/my_page/checked'
      expect(response).to have_http_status(:success)
    end
  end
end
