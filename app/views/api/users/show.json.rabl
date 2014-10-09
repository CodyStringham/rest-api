object @user

attributes :id, :name, :age, :city, :state

child :dreams do
  attributes :id, :category, :description
  node(:formatted_date){|date| date.date.strftime("%m/%d/%y")}
end

