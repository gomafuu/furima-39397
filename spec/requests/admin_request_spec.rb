require 'rails_helper'

RSpec.describe "Admins", type: :request do

  describe "GET /delete_items" do
    it "returns http success" do
      get "/admin/delete_items"
      expect(response).to have_http_status(:success)
    end
  end

end
