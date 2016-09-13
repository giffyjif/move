class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:user).all
    render 'index.json.jbuilder'
  end

  def create
    @comment = Comment.create(
      user_id: current_user.id,
      body: params[:body]
    )
    ActionCable.server.broadcast 'activity_channel', {
      id: @comment.id,
      name: @comment.user.full_name,
      body: @comment.body,
      created_at: @comment.created_at
    }
    render 'show.json.jbuilder'
  end
end
