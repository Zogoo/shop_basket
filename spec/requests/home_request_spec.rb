require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/home/search"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /category" do
    it "returns http success" do
      get "/home/category"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /suggestion" do
    it "returns http success" do
      get "/home/suggestion"
      expect(response).to have_http_status(:success)
    end
  end

end
