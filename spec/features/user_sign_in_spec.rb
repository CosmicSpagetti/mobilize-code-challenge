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
        fill_in "user[phone_number]", with: "1234567"
        click_on "Submit"

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You are now logged in, Billy")
    end
  end
  describe "you can fail to up by leaving empty fields" do 
    it "fail to create account when no name is entered" do 
      visit root_path
        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)

        
        fill_in "user[password]",  with: "12345"
        fill_in "user[password_confirmation]", with: "12345"
        fill_in "user[phone_number]", with: "1234567"
        click_on "Submit"

        expect(page).to have_content("Name can't be blank")
    end
  end

  describe "you can fail to up by leaving empty fields" do 
    it "fail to create account when no phone number is entered" do 
      visit root_path
        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)

        
        fill_in "user[name]", with: "Billy"
        fill_in "user[password]",  with: "12345"
        fill_in "user[password_confirmation]", with: "12345"
        click_on "Submit"

        expect(page).to have_content("Phone number can't be blank")
    end
  end

  describe "you can fail to up by leaving empty fields" do 
    it "fail to create account when no password is entered" do 
      visit root_path
        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)

        

        fill_in "user[name]", with: "Billy"
        fill_in "user[phone_number]", with: "1234567"
        click_on "Submit"

        expect(page).to have_content("Password can't be blank")
    end
  end

  describe "sign in when they enter name and password if account exists" do 
    it "can sign in" do 
      user = User.create!(name: "Billy2", password: "123", phone_number: "1234567")
      visit root_path 
      click_on "Login"

      fill_in "name", with: "Billy2"
      fill_in "password", with: "123"
      click_on "Login"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are now logged in, #{user.name}")
    end

    it "can fail log in if no account exists" do 
      visit root_path 
      click_on "Login"

      fill_in "name", with: "Billy2"
      fill_in "password", with: "123"
      click_on "Login"

      expect(page).to have_content("Incorrect Username/Password Combination")
    end
    it "can fail to log in if name is wrong" do 
      user = User.create!(name: "Billy2", password: "123", phone_number: "1234567")
      visit root_path 
      click_on "Login"

      fill_in "name", with: "Billy1"
      fill_in "password", with: "123"
      click_on "Login"

      expect(page).to have_content("Incorrect Username/Password Combination")
    end
  end
end