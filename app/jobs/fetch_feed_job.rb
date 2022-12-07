class FetchFeedJob < ApplicationJob

  def perform(feed_fetch)

    ids = feed_fetch.ids
    outstanding_id_set = Set.new(ids)
    stories = Story.where(remote_id: ids)
    stories.each do |story|
      outstanding_id_set.remove(story.remote_id)
    end

    hn = HackerNews.new
    outstanding_id_set.each do |id|
      story = Story.from_hn(hn.get_item(id))
      story.save!
    end

    feed_fetch.in_progress = false
    feed_fetch.save!
  end

end