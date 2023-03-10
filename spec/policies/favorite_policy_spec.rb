require 'rails_helper'

RSpec.describe FavoritePolicy, type: :policy do
  user = User.create(email: 'example@example.com', password: 'password')
  second_user = User.create(email: 'test@test.com', password: 'secure_password')

  first_post = Post.create(hacker_news_post_id: 2)
  first_favorite = Favorite.create(user_id: user.id, post_id: first_post.id)

  second_post = Post.create(hacker_news_post_id: 3)
  second_favorite = Favorite.create(user_id: second_user.id, post_id: second_post.id)

  
  describe '#destroy?' do
  context 'when the user owns the favorite' do
    policy = described_class.new(user, first_favorite) 
      it 'allows the user to delete the favorite' do
        expect(policy.destroy?).to be_truthy
      end
    end

    context 'when the user does not own the favorite' do
      policy = described_class.new(user, second_favorite) 

      it 'does not allow the user to delete the favorite' do
        expect(policy.destroy?).to be_falsey
      end
    end
  end
end