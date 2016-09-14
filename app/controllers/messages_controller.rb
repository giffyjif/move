class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  # skip_before_filter :authenticate_user!, :only => "reply"
 
  def reply
    message_body = params["Body"]
    from_number = params["From"]
    error_message = 'Sorry we didnt understand that'
    comment_data = Unirest.get('http://localhost:3000/api/v1/comments').body
    challenge_data = Unirest.get('http://localhost:3000/api/v1/challenges').body
    comment_message = []
    comment_data.each do |d|
      comment_message << d['name'] + ": " + d['body']
    end
    challenge_message = []
    challenge_data.each do |d|
      challenge_message << d['description'] + " " + "lat: " + d['lat'].to_s + " " + "lng: " + d['lng'].to_s
    end
    boot_twilio
    if message_body == 'comments'
      sms = @client.messages.create(
        from: ENV['twilio_number'],
        to: from_number,
        body: comment_message
      )
    elsif message_body == 'challenges'
      sms = @client.messages.create(
        from: ENV['twilio_number'],
        to: from_number,
        body: challenge_message
      )
    else
      sms = @client.messages.create(
        from: ENV['twilio_number'],
        to: from_number,
        body: error_message
      )
    end
    
  end
 
  private
 
  def boot_twilio
    account_sid = ENV['twilio_sid']
    auth_token = ENV['twilio_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
