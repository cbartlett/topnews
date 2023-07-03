require 'rails_helper'

RSpec.describe Story, type: :model do
  context "creating a new story" do
    let(:attrs) do
      { title: 'story title', author: 'webber', external_id: 2, time: 3 }
    end

    it "should have title, author, external_id, and time" do
      expect { Story.create!(attrs) }.to change{ Story.count }.by(1)
    end

    it "should require a external_id" do
      expect(Story.new(attrs.except(:external_id))).to be_invalid
    end

    it 'should not create a duplicate story' do
      expect { Story.create!(attrs) }.to change{ Story.count }.by(1)
      expect { Story.create!(attrs) }.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: External has already been taken')
    end
  end
end