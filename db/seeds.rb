User.destroy_all
Sport.destroy_all
Location.destroy_all
Favorite.destroy_all
Challenge.destroy_all
UserChallenge.destroy_all
SportLocation.destroy_all

5.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  age = Random.new.rand(18..35)

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@yahoo.com",
    password: "password",
    age: age
  )

  sport_name = ["Basketball", "Soccer", "Football", "Hockey", "Baseball", "Tennis"]

  Sport.create(
    name: sport_name.sample
  )
 
  location_name = ["park", "gym", "fieldhouse", "school", "track"]
  latitude = Faker::Address.latitude
  longitude = Faker::Address.longitude

  Location.create(
    name: location_name.sample,
    longitude: latitude,
    latitude: longitude
  )

  SportLocation.create(
    location_id: Location.ids.sample,
    sport_id: Sport.ids.sample
  )

  Favorite.create(
    user_id: User.ids.sample,
    sport_id: Sport.ids.sample
  )

  Favorite.create(
    user_id: User.ids.sample,
    location_id: Location.ids.sample
  )

  text = ["1v1 Basketball", "1v1 Soccer", "1v1 Tennis", "1v1 Run"]
  challenge = Challenge.create(
    creator_id: User.ids.sample,
    location_id: Location.ids.sample,
    sport_id: Sport.ids.sample,
    text: text.sample
  )

  UserChallenge.create(
    user_id: User.ids.sample,
    challenge_id: Challenge.ids.sample
  )
end
p "Done"
