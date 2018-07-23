json.extract! event, :id, :idx, :event_type, :created_at, :updated_at
json.url event_url(event, format: :json)
