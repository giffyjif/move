json.array! @comments.each do |comment|
  json.id comment.id
  json.name comment.user.full_name
  json.body comment.body
end