require 'rails_helper'

RSpec.describe Post, type: :model do

   before(:all)do

     @post = Post.new(body: "My body", title: "My title")

   end

   it "should have a matching body" do

     expect(@post.body).to eq("My body")

   end

    it "should have a matching title" do

     expect(@post.title).to eq("My title")

   end

end