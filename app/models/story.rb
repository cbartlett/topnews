class Story < ApplicationRecord

  def self.from_hn(hn_format)
    self.new(
      descendents: hn_format["descendents"],
      author: hn_format["by"],
      remote_id: hn_format["id"],
      kids: hn_format["kids"],
      remote_type: hn_format["type"],
      score: hn_format["score"],
      remote_timestamp: Time.at(hn_format["time"]),
      title: hn_format["title"],
      url: hn_format["title"]
    )
  end
end
