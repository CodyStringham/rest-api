collection [@dream] => :dreams

attributes :id, :category, :description
node(:date){|date| date.date.strftime("%m/%d/%y")}

child :user do
  attributes :id, :name, :age, :city, :state
end
