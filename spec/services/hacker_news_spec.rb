require 'spec_helper'

describe HackerNews do
  let!(:user) { create(:user)}

  context "stories json" do
    it "should parse the data" do
      allow_any_instance_of(HackerNews).to receive(:parsed_story).and_return(
         [
           {"by"=>"joe_wilson",
           "descendants"=>83,
           "id"=>16515470,
           "kids"=> [16515532,16515828],
           "score"=>163,
           "text"=> "test text",
           "time"=>1520184068,
           "title"=>"Ask HN: meeting at 3?",
           "type"=>"story"}
         ]
      )
      response = HackerNews.new(user).stories_json
      expect(response).to eq([{:title=>"Ask HN: meeting at 3?", :text=>"test text", :starred=>false, :hn_id=>16515470, :users_starred=>"", :current_user_name=>"Joe Smith"}])
    end

    it "should strip out html entities" do
      allow_any_instance_of(HackerNews).to receive(:parsed_story).and_return(
         [
           {"by"=>"joe_wilson",
           "descendants"=>83,
           "id"=>16515470,
           "kids"=> [16515532,16515828],
           "score"=>163,
           "text"=> "Hi all,<p>I need some advice from all the wonderful people on Hacker News &#38;&#38;&#38;",
           "time"=>1520184068,
           "title"=>"Ask HN: meeting at 3?",
           "type"=>"story"}
         ]
      )
      response = HackerNews.new(user).stories_json
      expect(response).to eq([{:title=>"Ask HN: meeting at 3?", :text=>"Hi all,I need some advice from all the wonderful people on Hacker News &&&", :starred=>false, :hn_id=>16515470, :users_starred=>"", :current_user_name=>"Joe Smith"}])
    end

    context "starred stories" do
      let!(:user) { create(:user)}
      let!(:story) { create(:story, user: user) }

      it "should return true if there is a star for the story" do
        allow_any_instance_of(HackerNews).to receive(:parsed_story).and_return(
           [
             {"by"=>"joe_wilson",
             "descendants"=>83,
             "id"=>1234567,
             "kids"=> [16515532,16515828],
             "score"=>163,
             "text"=> "Hi all, I need some advice from all the wonderful people on Hacker News",
             "time"=>1520184068,
             "title"=>"Ask HN: meeting at 3?",
             "type"=>"story"}
           ]
        )
        response = HackerNews.new(user).stories_json
        expect(response).to eq([{:title=>"Ask HN: meeting at 3?", :text=>"Hi all, I need some advice from all the wonderful people on Hacker News", :starred=>true, :hn_id=>1234567, :users_starred=>"Joe Smith", :current_user_name=>"Joe Smith"}])
      end
    end
  end
end
