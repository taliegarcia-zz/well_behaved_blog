require 'rails_helper'

RSpec.feature "Showing Article" do

  before do
    @grace = User.create(email: "grace@example.com", password: "password")
    @tamara = User.create(email: "tamara@example.com", password: "password")
    @article = Article.create(title: "The First Article", body: "Body of first article", user: @grace)
  end

  scenario "A non-signed-in User does not see Edit or Delete links" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")

  end

  scenario "A signed-in, non-owner User does not see Edit or Delete links" do
    login_as(@tamara)

    visit "/"
    click_link @article.title

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "A signed-in, Owner User can see the Edit and Delete links" do
    login_as(@grace)

    visit "/"
    click_link @article.title

    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end

  scenario "Show individual article" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end

