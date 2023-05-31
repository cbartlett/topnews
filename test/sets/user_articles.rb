module Contexts
    module UserArticles
  
      def create_user_articles
        
        @jane_like1 = FactoryBot.create(:user_article, user: @jane, article: @nytimes)
        @lily_like1 = FactoryBot.create(:user_article, user: @lily, article: @nytimes)
        @frank_like1 = FactoryBot.create(:user_article, user: @frank, article: @washington_post)
      end
  
  
        
      def _user_articles
        @jane_like1.destroy
        @lily_like1.destroy
        @frank_like1.destroy
      end
  
    end
  end