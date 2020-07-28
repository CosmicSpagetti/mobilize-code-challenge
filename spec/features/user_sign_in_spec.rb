require "rails_helper"

describe "user can" do
  describe "Create account when they fill in name password and phone number" do
      it "Creates account" do
        visit root_path
        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)

        fill_in "user[name]", with: "Billy"
        fill_in "user[password]",  with: "12345"
        fill_in "user[password_confirmation]", with: "12345"
        click_on "Submit"

        binding.pry
        expect(page).to have_content("You are now logged in, Billy")
    end
  end

  describe "sign in when they enter name and password if account exists" do 
    it "can sign in" do 
      user = User.create(name: "Billy2", password: "123", phone_number: "1234567")
      visit root_path 
      click_on "Login"

      fill_in "user[name]", with: "Billy2"
      fill_in "user[password]", with: "123"
      click_on "Submit"

     expect(page).to have_content("You are now logged in, #{user.last.name}")
    end
  end
end