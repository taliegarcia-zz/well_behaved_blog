require "rails_helper"

RSpec.feature "User sign in" do

  before do
    @grace = User.create!(email: "grace@example.com", password: "password")
  end

  scenario "User signs in with valid credentials" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @grace.email
    fill_in "Password", with: @grace.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@grace.email}")
  end

end
