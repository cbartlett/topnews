require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  user = User.create(email: 'example@example.com', password: 'password')
  post = Post.create(hacker_news_post_id: 2, title: 'Example Title', url: 'https://example.com', score: 1,
                     by: 'Example User', time: Time.zone.now)
  favorite = Favorite.create(user_id: user.id, post_id: post.id)

  describe '#index' do
    before do
      sign_in(user)
      get '/favorites'
    end
    it 'renders the correct template' do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    before do 
      sign_in(user)
      post favorites_path(user_id: user.id, post_id: post.id)
    end

    it 'creates a favorite' do
      expect(response).to redirect_to(favorites_path)
    end
  end

  describe '#destroy' do
    before { sign_in(user) }

    it 'deletes the favorite' do
      expect do
        delete favorite_path(favorite)
      end.to change(Favorite, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
