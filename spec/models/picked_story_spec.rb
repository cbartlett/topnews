require 'rails_helper'

RSpec.describe PickedStory, type: :model do
  context "creating a picked story" do
    let(:picked_story_attrs) do 
        { story_id: story, user_id: user }
    end
    let(:story_attrs) do
      { title: 'story title', author: 'webber', external_id: 2, time: 3 }
    end

    let(:user_attrs) do
      { first_name: :foo, last_name: :bar, email: 'f@b.c', password: 'foobar123' }
    end

    let(:story) { Story.create!(story_attrs) }
    let(:user) { User.create!(user_attrs) }

    it "should have user_id and story_id" do
      expect { PickedStory.create!(user: user, story: story) }.to change{ PickedStory.count }.by(1)
    end

    it "should require a user_id" do
      expect(PickedStory.new(picked_story_attrs.except(:user_id))).to be_invalid
    end

    it 'should not create a duplicate picked story' do
      expect { PickedStory.create!(user: user, story: story) }.to change{ PickedStory.count }.by(1)
      expect { PickedStory.create!(user: user, story: story) }.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Story user should not picked same story more than once')
    end
  end
end