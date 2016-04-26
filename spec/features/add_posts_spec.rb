require 'rails_helper'

RSpec.feature "adding posts" do
    
   scenario "allow a user to add a post", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "33second@example.so"
    fill_in "password",              :with => "12345678"
    fill_in "password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")

    
       click_on("new")
       

       fill_in "title", with: "mugenseikatsu"
       fill_in "body", with: "asfastasbolt"

       click_on("create_todo")
       
       expect(page).to have_content("mugenseikatsu")
       expect(page).to have_content("asfastasbolt")
       puts page.body

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")    
       
   end

    scenario "allow a user to add and delete a post", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "33second@example.mo"
    fill_in "password",              :with => "12345678"
    fill_in "password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")

    
       click_on("new")
       

       fill_in "title", with: "mugenseikatsu"
       fill_in "body", with: "asfastasbolt"

       click_on("create_todo")
       
       expect(page).to have_content("mugenseikatsu")
       expect(page).to have_content("asfastasbolt")
       puts page.body
       
       click_on("delete")
       expect(page).to have_content("deleted")

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.") 
   end

     scenario "allow a user to add and edit a post", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "33second@example.lo"
    fill_in "password",              :with => "12345678"
    fill_in "password_confirmation", :with => "12345678"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")

    
       click_on("new")
       

       fill_in "title", with: "mugenseikatsu"
       fill_in "body", with: "asfastasbolt"

       click_on("create_todo")
       
       expect(page).to have_content("mugenseikatsu")
       expect(page).to have_content("asfastasbolt")
       puts page.body
       
       click_on("edit")
       puts page.body
       fill_in "title", with: "I will be able to live happily"
       fill_in "body", with: "I will try "

       click_on("edit_post")

       expect(page).to have_content("I will be able to live happily")
       expect(page).to have_content("I will try ")

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.") 
       
   end

end


    
  

