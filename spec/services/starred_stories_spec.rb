require 'spec_helper'

describe StarredStories do
  let!(:user) { create(:user)}
  let!(:second_user) { create(:second_user)}
  let!(:story) { create(:story, user: user) }

  context "all stories" do
    let!(:second_story) { create(:second_story, user: second_user) }

    it "should be fetched" do
      response = StarredStories.new().fetch
      expect(response).to eq([
        {:title=>"HN Story 1",
         :text=>"HN top of the news story 1",
         :users_starred=>"Joe Smith"},
        {:title=>"HN Story 2",
         :text=>"HN top of the news story 2",
         :users_starred=>"Mike Jones"}])
    end
  end

  context "stories that are starred by two employees" do
    let!(:third_story) { create(:story, user: second_user) }

    it "should be grouped" do
      response = StarredStories.new().fetch
      expect(response).to eq([
        {:title=>"HN Story 1",
         :text=>"HN top of the news story 1",
         :users_starred=>"Joe Smith Mike Jones"}])
    end
  end
end
