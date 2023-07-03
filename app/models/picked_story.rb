class PickedStory < ApplicationRecord
  belongs_to :story
  belongs_to :user

  validates :story_id, uniqueness: { scope: :user_id,
    message: "user should not picked same story more than once" }
end
  