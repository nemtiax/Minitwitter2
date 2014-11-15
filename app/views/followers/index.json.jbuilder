json.array!(@followers) do |follower|
  json.extract! follower, :id, :follower, :followee
  json.url follower_url(follower, format: :json)
end
