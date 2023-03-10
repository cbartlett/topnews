# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe '#index' do
    user = User.create(email: 'example@example.com', password: 'secure_password')
    before do
      sign_in(user)
      get '/posts'
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end
end
