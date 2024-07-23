namespace :articles do
  desc 'Fetch articles and save them'
  task get_and_create: :environment do
    ids = HackerNews::Api::GetRecentArticles.()
    HackerNews::Api::GetRecentArticles.().each do |id|
      puts "#{id} fetching"
      api_response = HackerNews::Api::GetArticle.(id)
      HackerNews::Articles::Store.(api_response)
      puts "#{id} saved"
    end
  end
end
