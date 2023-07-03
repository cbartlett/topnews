class Story < ApplicationRecord
  has_many :picked_stories, dependent: :destroy
  has_many :users, through: :picked_stories

  validates :title, :author, :external_id, :time, presence: true
  validates :external_id, uniqueness: true
end
