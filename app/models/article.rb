class Article < ApplicationRecord

  validates :external_id, presence: true
  validates :time, presence: true
  validates :by, presence: true
  validates :url, presence: true
  validates :title, presence: true
  validates :kind, presence: true
  validates :data, presence: true

  has_many :users_articles
  has_many :users, through: :users_articles

end
