require 'rails_helper'

RSpec.feature "Editing Article" do

  before do
    @grace = User.create!(email: "grace@example.com", password: "password")
    login_as(@grace)
    @article = Article.create(title: "The First Article", body: "Body of first article", user: @grace)
  end

  scenario "A user updates an individual article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated Article Title"
    fill_in "Body", with: "Updated Body of Article"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an individual article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end


end
