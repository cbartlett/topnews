require 'spec_helper'

RSpec.feature "Hacker News Request", :type => :feature do
  before(:all) { VCR.insert_cassette 'hacker_news' }
  after(:all) { VCR.eject_cassette 'hacker_news' }

  it 'queries Hacker News new stories' do
    uri = URI('https://hacker-news.firebaseio.com/v0/askstories.json?print=pretty')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end
end
