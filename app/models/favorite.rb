class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_id, uniqueness: { scope: %i[user_id] }
end
