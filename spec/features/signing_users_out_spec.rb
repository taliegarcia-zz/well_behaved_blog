require "rails_helper"

RSpec.feature "Signing out signed-in users" do

  before do
    @grace = User.create!(email: "grace@example.com", password: "password")

    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @grace.email
    fill_in "Password", with: @grace.password
    click_button "Log in"
  end

  scenario "User signs out" do
    visit "/"

    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
  end

end