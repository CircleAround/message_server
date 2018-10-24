json.array!(@messages) do |message|
  json.extract! message, :contents, :user_id
  json.url message_url(message, format: :json)
end