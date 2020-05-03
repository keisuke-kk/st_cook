json.array! @categories do |category|
  json.id category.id
  json.name category.name
  json.user_id category.user_id
  json.nickname category.user.nickname
  json.user_sign_in current_user
end