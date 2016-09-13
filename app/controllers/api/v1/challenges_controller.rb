class Api::V1::ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
    render 'index.json.jbuilder'
  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  
  def create
    @challenge = Challenge.new(
      description: params['description'],
      challenge_location: params['challenge_location'],
      lat: params['lat'],
      lng: params['lng'],
      creator_id: current_user.id 
    )
    if @challenge.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @challenge.errors.full_messages }, status: 422
    end
  end

  def update
    @challenge = Challenge.find_by(id: params[:id])
    @challenge.update(
      description: params['description'] || @challenge.description,
      challenge_location: params['challenge_location'] || @challenge.challenge_location,
      creator_id: params['creator_id'] || @challenge.creator_id
    )
    render 'show.json.jbuilder'
  end

  def destroy
    @challenge = Challenge.find_by(id: params[:id])
    @challenge.destroy
    @challenges = Challenge.all
    render json: { message: "Challenge successfully deleted!" }
  end
end
