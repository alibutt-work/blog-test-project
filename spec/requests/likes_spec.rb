# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'

  let!(:user) { create(:user) }
  let!(:post_record) { create(:post) }

  before do
    sign_in user
  end

  describe 'POST /posts/:post_id/like' do
    context 'when the user has not liked the post yet' do
      it 'creates a like for the post' do
        expect do
          post post_likes_path(post_id: post_record.id)
        end.to change(Like, :count).by(1)

        expect(response).to redirect_to(post_record)
        follow_redirect!

        expect(response.body).to include(post_record.title) # or any other assertion on the post page
      end
    end

    context 'when the user has already liked the post' do
      before do
        post_record.likes.create(user:)
      end

      it 'destroys the like for the post' do
        expect do
          post post_likes_path(post_id: post_record.id)
        end.to change(Like, :count).by(-1)

        expect(response).to redirect_to(post_record)
        follow_redirect!

        expect(response.body).to include(post_record.title) # or any other assertion on the post page
      end
    end
  end
end
