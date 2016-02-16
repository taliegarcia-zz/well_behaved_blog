require 'rails_helper'
require 'support/macros'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    before do
      @grace = User.create(email: "grace@example.com", password: "password")
    end

    context "owner is allowed to edit her articles" do
      it "renders the edit template" do
        login_user @grace
        article = Article.create(title: "First Article", body: "Body text of first test article", user: @grace)

        get :edit, id: article
        expect(response).to render_template :edit
      end
    end

    context "non-owner is not allowed to edit other users articles" do
      it "redirects to the root path" do
        @tamara = User.create(email: "tamara@example.com", password: "password")
        login_user @tamara
        article = Article.create(title: "First Article", body: "Body text of first test article", user: @grace)

        get :edit, id: article
        expect(response).to redirect_to(root_path)
        message = "You can only edit your own article."
        expect(flash[:danger]).to eq message
      end
    end


    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
