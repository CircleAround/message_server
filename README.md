# MessageServer

https://message-server-app.herokuapp.com

## これは何ですか？
とても簡単なREST APIサーバーです。主に以下の2モデルを操作できます。

- User
  - email をアカウントIDとして、トークンを取得するために使う
- Messaage
  - コンテンツとして文章を持ち、画像と共に送信できます

サークルアラウンド社で行なっているiOSトレーニングのアプリ開発の練習用に作成しました。

### クライアント実装
- https://github.com/KazuGeoge/texchdrive-plactice : KazuGeogeさんがトレーニングで作成したSwiftの実装
- https://github.com/CircleAround/message_server_js : ms2satoが作成したJSの実装

## Registrations
ユーザー登録や、トークン再発行です。

### Sign up

新規ユーザーを作成します。tokenをリクエストヘッダに入れることでmessageに対して各種処理を実現できます。

```
curl -X POST -H "Content-Type: application/json" -d '{"email":"test2@example.com"}' message-server-app.herokuapp.com/api/sign_up

{"email":"test2@example.com","token":"212cebd4164d5e1a","created_at":"2018-10-25T07:34:04.406Z","updated_at":"2018-10-25T07:34:04.406Z"}
```

### Login

簡易的なログインです。メールアドレスに一致するユーザに対して新しいトークンを発行します。

```
curl -X POST -H "Content-Type: application/json" -d '{"email":"test2@example.com"}' message-server-app.herokuapp.com/api/login

{"email":"test2@example.com","token":"81deb223e630f74d","created_at":"2018-10-25T07:34:04.406Z","updated_at":"2018-10-25T07:35:21.996Z"}
```



## Messages
Authorizationに指定する文字列は、Usersで作成したユーザが持っているtokenの値です。読み替えて利用してください。


### Create Message

通常のメッセージ作成

```
curl -X POST -H "Content-Type: application/json" -H "Authorization: 0a86cb7dac9f3a50" -d '{"contents":"test"}' message-server-app.herokuapp.com/api/messages

// CODE 201
{"id":3,"contents":"test","user_id":1,"created_at":"2018-10-25T06:47:40.865Z","updated_at":"2018-10-25T06:47:40.865Z"}
```

画像ファイルアップロード

```
curl -H "Authorization: b06a8520b289e1bc" -F message[image]=@/path/to/image message-server-app.herokuapp.com/api/messages/12/images
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

### Get All Messages

```
curl -X GET -H "Content-Type: application/json" -H "Authorization: 0a86cb7dac9f3a50" message-server-app.herokuapp.com/api/messages/

[{"id":1,"contents":"test","user_id":1,"url":"http://message-server-app.herokuapp.com/messages/1.json"},{"id":2,"contents":"test","user_id":1,"url":"http://message-server-app.herokuapp.com/messages/2.json"}]
```
