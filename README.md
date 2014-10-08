rest-api
========

This is a simple rest-api that has two models: User and Dream. A dream belongs to a user, and a user has many dreams.

#### Making a Call
```bash
curl -H "Content-Type: application/json" -d  '{"user":{"name":"Quintin","age":"22","city":"Park+City","state":"UT"}}' http://rest-api.dev/api/users
```
