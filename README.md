rest-api
========

This is a simple rest-api that has two models: User and Dream. A dream belongs to a user, and a user has many dreams.
_______________
####cURL Post
```bash
curl -H "Content-Type: application/json" -d '{"user":{"name":"Bobby","age":"42","city":"West Jordan","state":"UT"}}' http://rest-api.dev/api/users
```
`-H` lets you pass in a header to the call, `-d` shorthand for `--data` tells curl to do a `POST` request.
