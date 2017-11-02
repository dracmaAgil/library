require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #—no-helper" do
    it "returns http success" do
      get :—no-helper
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #—no-assets" do
    it "returns http success" do
      get :—no-assets
      expect(response).to have_http_status(:success)
    end
  end

end
