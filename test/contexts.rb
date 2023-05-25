# require needed files
require './test/sets/users'
require './test/sets/articles'
require './test/sets/user_articles'


module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Users
  include Contexts::Articles
  include Contexts::UserArticles
  
  def create_all
    # Kernel.puts "Building context..."
    create_users
    # Kernel.puts "Created users"
    create_articles
    # Kernel.puts "Created articles"
    create_user_articles
    # Kernel.puts "Registered students on user_articles"
  end
  
end