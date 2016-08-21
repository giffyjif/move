class ChallengesController < ApplicationController
  def index
    if current_user
      @challenges = current_user.challenges
      render 'index.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page!"
      redirect_to '/login'
    end
  end

  def new
    @challenge = Challenge.new
    render 'new.html.erb'
  end

  def create
    @challenge = Challenge.create(
      text: params['text'],
      sport_id: params['sport_id'],
      location_id: params['location_id'],
      creator_id: current_user.id 
    )
    binding.pry
    if @challenge.save
      flash[:success] = "challenge successfully created!"
      redirect_to "/challenges/#{@challenge.id}"
    else
      render 'new.html.erb'
    end
  end

  def show
    @challenge = Challenge.find_by(id: params['id'])
    render 'show.html.erb'
  end

  def edit
    @challenge = Challenge.find_by(id: params['id'])
    render 'edit.html.erb'
  end

  def update
    @challenge = Challenge.find_by(id: params['id'])
    @challenge.update(
      text: params['text'],
      sport_id: params['sport_id'],
      location_id: params['location_id'],
      creator_id: current_user.id
    )
    if @challenge.save
      flash[:success] = "challenge successfully updated!"
      redirect_to "/challenges/#{@challenge.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @challenge = Challenge.find_by(id: params['id'])
    @challenge.destroy
    redirect_to '/challenges'
  end
end

