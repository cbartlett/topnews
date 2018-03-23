require 'spec_helper'

RSpec.feature "Hacker News Request", :type => :feature do
  context "getting list of ask news stories" do
    before { VCR.insert_cassette 'hacker_news' }
    after { VCR.eject_cassette 'hacker_news' }

    it 'queries Hacker News ask stories' do
      uri = URI('https://hacker-news.firebaseio.com/v0/askstories.json?print=pretty')
      response = Net::HTTP.get(uri)
      expect(response).to be_an_instance_of(String)
    end
  end

  context "getting a single story" do
    before { VCR.insert_cassette 'single_story' }
    after { VCR.eject_cassette 'single_story' }

    it 'queries Hacker News for a single story' do
      uri = URI('https://hacker-news.firebaseio.com/v0/item/16509323.json?print=pretty')
      response = Net::HTTP.get(uri)
      expect(response).to be_an_instance_of(String)
    end
  end
end
