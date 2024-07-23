module HackerNews
  module Articles
    class Store

      def initialize(data)
        @data = data
      end

      def self.call(data)
        new(data).call
      end

      def call
        return if data_invalid?

        if existing_article?
          update_article
          return @existing_article
        end
        
        create_article
      end

      private
      def data_invalid?
        @data.nil? ||
          @data['id'].nil? ||
          @data['time'].nil? ||
          @data['by'].nil? ||
          @data['url'].nil? ||
          @data['title'].nil? ||
          @data['type'].nil?
      end

      def existing_article?
        @existing_article = Article.find_by(external_id: data_attributes[:external_id])
        @existing_article.present?
      end

      def update_article
        @existing_article.update!(data_attributes.except(:external_id))
      end

      def data_attributes
        # Could be extracted into a serializer
        {
          external_id: @data['id'],
          time: Time.at(@data['time'].to_i),
          by: @data['by'],
          url: @data['url'],
          title: @data['title'],
          kind: @data['type'],
          data: @data
        }
      end

      def create_article
        Article.create!(data_attributes)
      end
    end
  end
end
