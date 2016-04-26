require 'rails_helper'

RSpec.describe Comment, type: :model do

   before(:all)do

     @comment = Comment.new(body: "My body")

   end

   it "should have a matching body" do

     expect(@comment.body).to eq("My body")

   end

end