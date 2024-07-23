module ArticleHelper
  def star_classes(article, current_user)
    if article.users.include? current_user
      'article__star article__star--selected'
    else
      'article__star'
    end
  end
  def article_liked_by(article)
    article.users.map(&:full_name).to_sentence
  end
end
