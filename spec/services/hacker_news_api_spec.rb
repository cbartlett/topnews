require 'rails_helper'

RSpec.describe HackerNewsApi::V1::Client do
  
  before do
    allow(HackerNewsApi::V1::Client).to receive(:new).and_return(client)
  end
  
  describe '#top_stories' do
    let(:client) { instance_double(HackerNewsApi::V1::Client, top_stories: api_response) }
    let(:api_response) { [1, 3, 5] }

    it 'should return a list of ids' do
      expect(client.top_stories).to eq(api_response)
    end
  end

  describe '#find_story' do
  let(:client) { instance_double(HackerNewsApi::V1::Client, find_story: api_response) }
    let(:story_id) { 4 }
    let(:api_response) { 
      {
      "by"=>"pg", 
      "descendants"=>15, 
      "id"=>4, 
      "kids"=>[15, 234509, 487171, 82729], 
      "score"=>57, 
      "time"=>1160418111, 
      "title"=>"Y Combinator", 
      "type"=>"story", 
      "url"=>"http://ycombinator.com"
      }
    }

    it 'should return a story' do
      expect(client.find_story(story_id)).to include(api_response)
    end
  end
end
