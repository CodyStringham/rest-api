collection [@user] => :users

attributes :id, :name, :age, :city, :state

node :links do |user|
  links = {}
  if params['action'] == 'index'
    links[:show_user] = api_v1_user_url(user.id)
  else
    links[:all_users] = api_v1_users_url
  end
  links
end

child :dreams do
  attributes :id, :category, :description
  node(:date){|date| date.date.strftime("%m/%d/%y")}
  node :links do |dream|
    links = {}
    links[:show_dream] = api_v1_dream_url(dream.id)
    links[:all_dreams] = api_v1_dreams_url
    links
  end
end

# node :links do |user|
#   links = {}

#   links
# end
