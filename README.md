# MessageServer

https://message-server-app.herokuapp.com

### Create Message

```
curl -X POST -H "Content-Type: application/json" -H "Authorization: 0a86cb7dac9f3a50" -d '{"contents":"test"}' message-server-app.herokuapp.com/api/messages

// CODE 201
{"id":3,"contents":"test","user_id":1,"created_at":"2018-10-25T06:47:40.865Z","updated_at":"2018-10-25T06:47:40.865Z"}
```

### Update Message

```
curl -X PUT -H "Content-Type: application/json" -H "Authorization: 0a86cb7dac9f3a50" -d '{"contents":"updated"}' message-server-app.herokuapp.com/api/messages/3

// CODE 204 
No Response Body
```

### Get Message

```
 curl -X GET -H "Content-Type: application/json" -H "Authorization: 0a86cb7dac9f3a50" message-server-app.herokuapp.com/api/messages/3

// CODE 200
{"id":3,"contents":"updated","user_id":1,"created_at":"2018-10-25T06:47:40.865Z","updated_at":"2018-10-25T06:49:32.043Z"}
```

### Delete Message

```
curl -X DELETE -H "Content-Type: application/json" -H "Authorization: 0a86cb7dac9f3a50" message-server-app.herokuapp.com/api/messages/3

// CODE 204 
No Response Body
```
