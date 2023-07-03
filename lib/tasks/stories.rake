namespace :stories do
  desc "TODO"
  task create_stories: :environment do
    logger.info 'hello'
    client = HackerNewsApi::V1::Client.new
    top_stories = client.top_stories
    list_of_stories = []
    
    top_stories.each do |story_id|
      story = client.find_story(story_id)
      list_of_stories.push(story) if story["type"] == 'story'
    end
          
    updated_stories = list_of_stories.map do |story| 
      story.symbolize_keys.
            transform_keys({id: :external_id, by: :author}).
            except(:descendants, :kids, :score, :type, :text, :url) 
    end
    
    Story.upsert_all(updated_stories, unique_by: :external_id)
  end
end
