require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    it "assigns @expenses" do
      expect(response).to be_success
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end
end
