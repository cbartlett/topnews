class FeedFetch < ApplicationRecord

  REFRESH_FREQUENCY = 15.minutes

  def self.get_latest
    if !self.in_progress? && self.fetch_outdated?
      hn = HackerNews.new
      stories = hn.top_stories
      fetch = FeedFetch.create!(
        in_progress: true,
        ids: stories,
      )
      FetchFeedJob.perform_later(fetch)
    end

    return FeedFetch.where(in_progress: false).order("ID DESC").first, self.in_progress?
  end

  def self.in_progress?
    FeedFetch.where(in_progress: true).first.present?
  end

  def self.fetch_outdated?
    latest_fetch = FeedFetch.where(in_progress: false).order("id DESC").first
    !latest_fetch || latest_fetch.updated_at < Time.now - 15.minutes
  end
end
