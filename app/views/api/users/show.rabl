collection [@user] => :users

attributes :id, :name, :age, :city, :state

child :dreams do
  attributes :id, :category, :description
  node(:date){|date| date.date.strftime("%m/%d/%y")}
end



