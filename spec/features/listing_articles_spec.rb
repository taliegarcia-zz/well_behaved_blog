require 'rails_helper'

RSpec.feature "Listing Articles" do

  before do
    @grace = User.create(email: "grace@example.com", password: "password")
    @article1 = Article.create(title: "The First Article", body: "Body of first article", user: @grace)
    @article2 = Article.create(title: "The Second Article", body: "Body of second article", user: @grace)
  end

  scenario "List all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(page).not_to have_link("New Article")

  end
end

