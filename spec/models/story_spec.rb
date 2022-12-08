require 'rails_helper'

RSpec.describe Story, type: :model do
  describe "watched stories" do
    before(:each) do
      @u1 = User.create!(email: 'DonaldGMiller@example.com',
        first_name: 'Donald',
        last_name: 'Miller',
        password: 'eeMaev2shai'
      )

      @u2 = User.create!(email: 'LawrenceWGrant@example.com',
        first_name: 'Lawrence',
        last_name: 'Grant',
        password: 'ahR7iecai'
      )
    end

    it "should only return each story once if watched by multiple users" do
      s = Story.create(title: "whatever", url: "http://fake.com")
      puts s
      UserStory.create(user: @u1, story: s)
      UserStory.create(user: @u2, story: s)

      expect(Story.watched_stories).to eq([s])
    end
  end
end
