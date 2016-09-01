json.array! @current_user.challenges.each do |challenge|
  json.id challenge.id
  json.description challenge.description
  json.challenge_location challenge.challenge_location
end