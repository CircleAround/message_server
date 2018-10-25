json.array!(@messages) do |message|
  json.extract! message, :id, :contents, :user_id
  json.url message_url(message, format: :json)
end
