class UserArticle < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_presence_of :user_id, :article_id, uniqueness: true
end
