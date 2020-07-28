require "rails_helper"

describe "user can sign in" do
  describe "They fill in name password and phone number" do
      it "signs them in " do
        visit root

        expect(current_path).to eq(new_user_path)

        fill_in "user[name]", with: "Billy!!"
        fill_in "user[password]",  with: "12345"
        click_on "Create Account"

        expect(page).to have_content("You are now logged in")
    end
  end
end