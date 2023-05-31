class Article < ApplicationRecord
    # Relationships
    has_many :user_articles
    has_many :users, through: :user_articles

    # Scopes
    scope :alphabetical, -> { order('title') }
    scope :has_likes, -> { Article.includes(:user_articles).where.not(user_articles: { article_id: nil }) }
    
    # Validations
    validates_presence_of :article_id, :title, :author, :score, :url
    validates_numericality_of :score

    def to_sym
        :read_only
    end
    

end
