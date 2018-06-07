require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #" do
    it "renders the index template"  do
        product = create(:product)
        get :index
        expect(response).to render_template("index")
    end
  end
end


