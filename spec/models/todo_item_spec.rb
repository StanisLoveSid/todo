require 'rails_helper'

RSpec.describe TodoItem, type: :model do

   before(:all)do

     @todo_item = TodoItem.new(content: "My content", deadline: "10.04.2016")

   end

   it "should have a matching content" do

     expect(@todo_item.content).to eq("My content")

   end

    it "should have a matching deadline" do

     expect(@todo_item.deadline).to eq("10.04.2016")

   end

end