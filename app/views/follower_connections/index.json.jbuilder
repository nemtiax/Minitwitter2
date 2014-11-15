json.array!(@follower_connections) do |follower_connection|
  json.extract! follower_connection, :id, :follower_id, :followee_id
  json.url follower_connection_url(follower_connection, format: :json)
end
