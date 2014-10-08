json.dreams @dreams do |dream|

  json.id       dream.id
  json.name     dream.date
  json.age      dream.category
  json.city     dream.description

  json.user_id dream.user ? dream.user.id : nil

end
