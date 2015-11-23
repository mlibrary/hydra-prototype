require 'rails_helper'

RSpec.describe DeepBlue::CollectionsController, type: :controller do

  describe "GET #list_permissions" do
    it "returns http success" do
      get :list_permissions
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_permissions" do
    it "returns http success" do
      get :update_permissions
      expect(response).to have_http_status(:success)
    end
  end

end
