require 'rails_helper'

RSpec.feature "Deleting Article" do

  before do
    @user = User.create!(email: "grace@example.com", password: "password")
    login_as(@user)
    @article = Article.create(title: "The First Article", body: "Body of first article", user: @user)
  end

  scenario "A user deletes an individual article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end


end
