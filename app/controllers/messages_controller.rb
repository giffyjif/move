class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  # skip_before_filter :authenticate_user!, :only => "reply"
 
  def reply
    message_body = params["Body"]
    from_number = params["From"]
    data = Unirest.get('http://localhost:3000/api/v1/comments').body
    message = []
    data.each do |d|
      message << d['name'] + ": " + d['body']
    end
    boot_twilio
    sms = @client.messages.create(
      from: ENV['twilio_number'],
      to: from_number,
      body: message
    )
    
  end
 
  private
 
  def boot_twilio
    account_sid = ENV['twilio_sid']
    auth_token = ENV['twilio_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
