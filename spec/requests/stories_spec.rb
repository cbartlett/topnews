require 'rails_helper'

RSpec.describe "/stories", type: :request do
  let(:valid_attributes) {
    { title: 'story title', author: 'webber', external_id: 2, time: 3 }
  }

  let(:user_attrs) do
    { first_name: :foo, last_name: :bar, email: 'f@b.c', password: 'foobar123' }
  end

  let!(:story) { Story.create!(valid_attributes) }

  before do
    user = User.create!(user_attrs)
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      get stories_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get story_url(story)
      expect(response).to be_successful
    end
  end

  describe "POST /picked" do
    it "render a successful response" do
      params = {
        id: story.id,
        story_id: story.id,
      }
      expect(PickedStory.count).to eq(0)
      post story_picked_url(params)
      expect(response).to be_successful
      expect(PickedStory.count).to eq(1)
    end
  end
end
