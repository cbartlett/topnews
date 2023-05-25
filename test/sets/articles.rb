module Contexts
  module Articles

    def create_articles
      @nytimes    = FactoryBot.create(:article)
      @washington_post   = FactoryBot.create(:article, title: "Top Story", author: "John Doe", score: 500, url: "washingtonpost.com")
      @time   = FactoryBot.create(:article, title: "Top Story 2", author: "Janet Doe", score: 400, url: "time.com")
    end
    
    def destroy_articles
      @nytimes.destroy
      @washington_post.destroy
      @time.destroy
    end
  
  end
end
