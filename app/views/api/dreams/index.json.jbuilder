json.dreams @dreams do |dream|

  json.id       dream.id
  json.date     dream.date
  json.category      dream.category
  json.description     dream.description

  json.user_id dream.user ? dream.user.id : nil

end
