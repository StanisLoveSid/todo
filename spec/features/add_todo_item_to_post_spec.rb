require 'rails_helper'

RSpec.feature "adding todo_items to posts" do
    
   scenario "allow a user to add a todo_items", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "39second@example.lo"
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

       
       fill_in "todo_item_body", with: "it is new todo_item"
       fill_in "todo_item_deadline", with: "10.04.2016"
       click_on("new_todo_item")

       expect(page).to have_content("it is new todo_item")
       expect(page).to have_content("10.04.2016")
       puts page.body

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")    
       
   end

    scenario "allow a user to add and delete a todo_items", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "39second@example.lo"
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

       
       fill_in "todo_item_body", with: "it is new todo_item"
       fill_in "todo_item_deadline", with: "10.04.2016"
       click_on("new_todo_item")

       expect(page).to have_content("it is new todo_item")
       expect(page).to have_content("10.04.2016")

       click_on("delete_todo_item")
       expect(page).to have_content("Todo item is successfully deleted")
 

       puts page.body

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")    
       
   end

       scenario "allow a user to add and edit a todo_items", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "39second@example.lo"
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

       
       fill_in "todo_item_body", with: "it is new todo_item"
       fill_in "todo_item_deadline", with: "10.04.2016"
       click_on("new_todo_item")

       expect(page).to have_content("it is new todo_item")
       expect(page).to have_content("10.04.2016")

       click_on("edit_todo_item")
       puts page.body
     
       fill_in "edit_todo_item_body", with: "it is edited todo_item"
       fill_in "edit_deadline", with: "11.04.2016"

       click_on("update_todo")

       expect(page).to have_content("it is edited todo_item")
       expect(page).to have_content("11.04.2016")
 

       

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")    
       
   end

       scenario "allow a user to add and complete a todo_items", :js => true do
       
    visit "/users/sign_up"

    fill_in "email",                 :with => "39second@example.lo"
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

       
       fill_in "todo_item_body", with: "it is new todo_item"
       fill_in "todo_item_deadline", with: "10.04.2016"
       click_on("new_todo_item")

       expect(page).to have_content("it is new todo_item")
       expect(page).to have_content("10.04.2016")

       click_on("complete_todo_item")
       puts page.body
     

       expect(page).to have_content("Todo item is successfully completed")
      

       click_on("account")
       click_on("delete_account")
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")    
       
   end

 end