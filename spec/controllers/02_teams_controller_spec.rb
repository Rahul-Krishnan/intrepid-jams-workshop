require "rails_helper"

RSpec.describe TeamsController, type: :controller do
  let!(:team) do
    FactoryGirl.create(:team)
  end

  xdescribe "GET#index" do
    it "should return the teams list" do
      get :index
      json = JSON.parse(response.body)

      expect(json.name).to eq("MyString")
    end
  end
end
