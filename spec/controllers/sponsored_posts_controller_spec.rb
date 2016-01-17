require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }

  describe "GET show" do
     it "returns http success" do
       get :show, topic_id: my_topic.id, id: my_sponsored_post.id
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
        get :show, topic_id: my_topic.id, id: my_sponsored_post.id
       expect(response).to render_template :show
     end

     it "assigns my_sponsored_post to @sponsored_post" do
       get :show, topic_id: my_topic.id, id: my_sponsored_post.id
       expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
     end
    end
  end