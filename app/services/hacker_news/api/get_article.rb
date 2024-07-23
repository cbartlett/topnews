module HackerNews
  module Api
    class GetArticle
      
      ARTICLE_PATH = '/v0/item'.freeze

      def initialize(id)
        @id = id
      end

      def self.call(id)
        new(id).call
      end

      def call
        get_article
        parse_response
        
        @article
      end

      private
      def get_article
        @response = Faraday.get(article_url)
      end

      def article_url
        "#{BASE_URL + ARTICLE_PATH}/#{@id}.json"
      end

      def parse_response
        @article = if @response.status == 200
          JSON.parse(@response.body)
        end
      end

    end
  end
end
