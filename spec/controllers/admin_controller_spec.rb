require 'rails_helper'

RSpec.describe AdminController, :type => :controller do

  describe "GET competences" do
    it "returns http success" do
      get :competences
      expect(response).to be_success
    end
  end

end
