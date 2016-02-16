require 'rails_helper'

RSpec.feature "Deleting Article" do

  before do
    @grace = User.create!(email: "grace@example.com", password: "password")
    login_as(@grace)
    @article = Article.create(title: "The First Article", body: "Body of first article", user: @grace)
  end

  scenario "A user deletes an individual article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end


end
