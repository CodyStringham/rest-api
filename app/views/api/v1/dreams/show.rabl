collection [@dream] => :dreams

attributes :id, :category, :description, :user_id
node(:date){|dream| dream.date.strftime("%m/%d/%y")}

node :links do |dream|
  links = {}
  if params['action'] == 'index'
    links[:show_dream] = api_v1_dream_url(dream.id)
  else
    links[:all_dreams] = api_v1_dreams_url
  end
  links
end

child :user do
  attributes :id, :name, :age, :city, :state
  node :links do |user|
    links = {}
    links[:show_user] = api_v1_user_url(user.id)
    links[:all_users] = api_v1_users_url
    links
  end
end
