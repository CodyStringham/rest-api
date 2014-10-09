rest-api
========

Welcome to my API homework app. Built upon this amazing [RESTful API blog post](https://codelation.com/blog/rails-restful-api-just-add-water).
_______________
####Models
```ruby
User :name, :age, :city, :state
Dream :date, :category, :description, :user_id
```
_______________
####Views
`views/api/dreams` & `views/api/users` contain a index and show (currently jbuilder)
_______________
####Controllers
`controllers/api/base_controller` contains most logic, see private method comments
_______________
####cURL Post
```bash
curl -H "Content-Type: application/json" -d '{"user":{"name":"Bobby","age":"42","city":"West Jordan","state":"UT"}}' http://rest-api.dev/api/users
```
`-H` lets you pass in a header to the call, `-d` shorthand for `--data` tells curl to do a `POST` request.
