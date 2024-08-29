# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    if @like.nil?
      @like = @post.likes.create(user: current_user)
    else
      @like.destroy
    end
    redirect_to @post.reload
  end
end
