require 'rails_helper'

RSpec.describe FeedFetch, type: :model do

  it "should refetch if stale" do
    allow(FeedFetch).to receive(:in_progress?).and_return(false)
    allow(FeedFetch).to receive(:fetch_outdated?).and_return(true)

    expect(FetchFeedJob).to receive(:perform_later)
    FeedFetch.get_latest
  end

end
