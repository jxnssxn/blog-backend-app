require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should return an array of posts" do

      user = User.create!(name: "Peter", email: "peter@email.com", password: "password")

      Post.create!(
        title: "somehting",
        body: "something more",
        image: "....",
        user_id: user.id
      )
      Post.create!(
        title: "algo",
        body: "algo mas",
        image: "....",
        user_id: user.id
      )
      Post.create!(
        title: "nagon",
        body: "nagot annat",
        image: "....",
        user_id: user.id
      )

      get "/api/posts"
      posts = JSON.parse(response.body)
      p "posts"
      p response.body
      expect(response).to have_http_status(200)
      expect(posts.length).to eq(3)
    end
  end
end
