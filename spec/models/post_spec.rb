# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  # Associations
  it { should belong_to(:user) }
  it { should have_many(:likes).dependent(:destroy) }

  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  # Instance Methods
  describe '#like_count' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user:) }

    before do
      create_list(:like, 3, post:)
    end

    it 'returns the number of likes for the post' do
      expect(post.like_count).to eq(3)
    end
  end
end
