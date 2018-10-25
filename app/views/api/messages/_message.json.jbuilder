json.extract! message, :id, :contents, :user_id, :created_at, :updated_at
json.url api_message_url(message, format: :json)
json.url polymorphic_url(message.image) if message.image.attached?
