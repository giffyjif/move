json.array! @challenges.each do |challenge|
  json.id challenge.id
  json.description challenge.description
  json.challenge_location challenge.challenge_location
  json.lng challenge.lng
  json.lat challenge.lat
end