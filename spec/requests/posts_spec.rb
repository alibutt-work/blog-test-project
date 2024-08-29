# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:post_record) { create(:post, user:) }

  include_context 'api request authentication helper methods'
  include_context 'api request global before and after hooks'

  before do
    sign_in user
  end

  describe 'GET /posts' do
    it 'returns a successful response' do
      get posts_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(post_record.title)
    end
  end

  describe 'GET /posts/:id' do
    it 'returns a successful response' do
      get post_path(post_record)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(post_record.title)
    end
  end

  describe 'GET /posts/new' do
    it 'returns a successful response' do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /posts/:id/edit' do
    it 'returns a successful response' do
      get edit_post_path(post_record)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /posts' do
    context 'with valid parameters' do
      it "creates a new post and redirects to the post's show page" do
        expect do
          post posts_path, params: { post: { title: 'New Post', content: 'This is a new post' } }
        end.to change(Post, :count).by(1)

        new_post = Post.last
        expect(response).to redirect_to(post_path(new_post))
        follow_redirect!
        expect(response.body).to include('Post was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new post and re-renders the new template' do
        expect do
          post posts_path, params: { post: { title: '', content: '' } }
        end.not_to change(Post, :count)

        expect(response).to have_http_status(422)
        expect(response.body).to include('prohibited this post from being saved')
      end
    end
  end

  describe 'PATCH /posts/:id' do
    context 'with valid parameters' do
      it "updates the post and redirects to the post's show page" do
        patch post_path(post_record), params: { post: { title: 'Updated Title' } }
        expect(response).to redirect_to(post_path(post_record))
        follow_redirect!

        expect(response.body).to include('Post was successfully updated.')
        expect(post_record.reload.title).to eq('Updated Title')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the post and re-renders the edit template' do
        patch post_path(post_record), params: { post: { title: '' } }
        expect(response).to have_http_status(422)
        expect(response.body).to include('prohibited this post from being saved')
        expect(post_record.reload.title).not_to eq('')
      end
    end
  end

  describe 'DELETE /posts/:id' do
    it 'destroys the post and redirects to the posts index' do
      expect do
        delete post_path(post_record)
      end.to change(Post, :count).by(-1)

      expect(response).to redirect_to(posts_path)
      follow_redirect!

      expect(response.body).to include('Post was successfully destroyed.')
    end
  end
end
