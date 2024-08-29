# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, :content, presence: true

  def like_count
    likes.count
  end
end
