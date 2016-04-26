require 'rails_helper'
require 'capybara/poltergeist'



RSpec.feature "adding comments to posts" do
    
   scenario "allow a user to add a comment", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "50second@example.qo"
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

       fill_in "comment_body", with: "haliluya"
       click_on("new_comment")
       expect(page).to have_content("haliluya")

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")    
       
   end


      scenario "allow a user to add and delete a comment", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "50second@example.qo"
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

       
       
       fill_in "comment_body", with: "haliluya"
       click_on("new_comment")

       expect(page).to have_content("haliluya")

       click_on("delete_comment")
       expect(page).to have_content("Comment is succsessfully deleted")

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")    
       
   end


 end