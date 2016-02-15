require "rails_helper"

RSpec.feature "Signing out signed-in users" do

  before do
    @user = User.create!(email: "grace@example.com", password: "password")

    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  scenario "User signs out" do
    visit "/"

    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
  end

end