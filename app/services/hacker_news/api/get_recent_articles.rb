module HackerNews
  module Api
    class GetRecentArticles
      
      ARTICLES_PATH = '/v0/topstories.json'.freeze

      def initialize; end

      def self.call
        new.call
      end

      def call
        get_articles
        parse_response
        
        @ids
      end

      private
      def get_articles
        @response = Faraday.get(recent_articles_url)
      end

      def recent_articles_url
        BASE_URL + ARTICLES_PATH
      end

      def parse_response
        @ids = if @response.status == 200
          JSON.parse(@response.body)
        end 
      end
    end
  end
end
