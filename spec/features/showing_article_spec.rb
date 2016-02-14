require 'rails_helper'

RSpec.feature "Showing Article" do

  before do
    @article = Article.create(title: "The First Article", body: "Body of first article")
  end

  scenario "Show individual article" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end

