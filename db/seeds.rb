User.destroy_all
Sport.destroy_all
Location.destroy_all
Favorite.destroy_all
Challenge.destroy_all
UserChallenge.destroy_all
SportLocation.destroy_all

user = User.create(
  first_name: "Mathew",
  last_name: "Vacha",
  email: "matvacha@yahoo.com",
  password: "password",
  age: 20
)

sport = Sport.create(
  name: "Basketball"
)

location = Location.create(
  name: "park",
  longitude: "-87.932599",
  latitude: "41.882512"
)

SportLocation.create(
  location_id: location.id,
  sport_id: sport.id
)

Favorite.create(
  user_id: user.id,
  sport_id: sport.id
)

Favorite.create(
  user_id: user.id,
  location_id: location.id
)

challenge = Challenge.create(
  creator_id: user.id,
  location_id: location.id,
  sport_id: 1,
  text: "1v1 Basketball"
)

UserChallenge.create(
  user_id: user.id,
  challenge_id: challenge.id
)
p "Done"
