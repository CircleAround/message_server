# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  token = User.generate_token
  user = User.create(email: "test#{i}@example.com", token: token)
  Message.create(contents: "#{i}番目のユーザーのメッセージ", user_id: user.id)
end