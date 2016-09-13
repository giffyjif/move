class CommentsController < ApplicationController
  def index
    render 'index.html.erb'
  end
 
  def create
    @comment = comment.create(
      body: params[:body],
      user_id: current_user.id
    )
    redirect_to "/comments"
  end
end
