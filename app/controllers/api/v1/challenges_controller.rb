class Api::V1::ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
    render 'index.json.jbuilder'
  end
  
  def create
    @challenge = Challenge.new(
      description: params['description'],
      challenge_location: params['challenge_location'],
      creator_id: current_user.id 
    )
    if @challenge.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @challenge.errors.full_messages }, status: 422
    end
  end
end
