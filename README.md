rest-api
========

Welcome to my API homework app. Built upon this amazing [RESTful API blog post](https://codelation.com/blog/rails-restful-api-just-add-water). This API is versioned and set up with json:api standards using rabl.

What's inside of the app
--------
####Models
```ruby
User :name, :age, :city, :state
Dream :date, :category, :description, :user_id
```

####Views
`views/api/v1/dreams` & `views/api/v1/users` contain a index and show

####Controllers
`controllers/api/v1/base_controller` contains the most logic, see private method comments. These will set and get the resource names as needed for each controller.

####Kaminari Pagination
Kaminari has a default page size of 25, to override this pass in a `page` or a `page_size` paramater like the following:
```
http://rest-api.dev/api/v1/users.json?page=2
http://rest-api.dev/api/v1/users.json?page_size=50
```


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
