require "rails_helper"

describe "user can create account" do
  describe "They fill in name password and phone number" do
      it "Creates account" do
        visit root_path
        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)

        fill_in "user[name]", with: "Billy"
        fill_in "user[password]",  with: "12345"
        fill_in "user[password_confirmation]", with: "12345"
        click_on "Submit"

        expect(page).to have_content("You are now logged in, Billy")
    end
  end
end