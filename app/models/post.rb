# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates_presence_of :title, :content

  def like_count
    likes.count
  end
end
