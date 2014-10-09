rest-api
========

Welcome to my API homework app. Built upon this amazing [RESTful API blog post](https://codelation.com/blog/rails-restful-api-just-add-water).

####Models
```ruby
User :name, :age, :city, :state
Dream :date, :category, :description, :user_id
```

####Views
`views/api/dreams` & `views/api/users` contain a index and show (currently jbuilder)

####Controllers
`controllers/api/base_controller` contains most logic, see private method comments


Lets make a call!
--------
#### HTTParty Get
```ruby
HTTParty.get 'http://rest-api.dev/api/v1/users.json'
```

#### HTTParty Post
```ruby
HTTParty.post('http://rest-api.dev/api/v1/users', body: { user: {name: "Json", age: "22", city: "Plainsville", state: "NV"} })
```

#### HTTParty Patch
```ruby
HTTParty.patch('http://rest-api.dev/api/v1/users/4', body: { user: {name: "Jason"} })
```

#### HTTParty Delete
```ruby
HTTParty.delete 'http://rest-api.dev/api/v1/users/4'
```
