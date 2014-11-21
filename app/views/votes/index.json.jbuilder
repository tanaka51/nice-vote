json.array!(@votes) do |vote|
  json.extract! vote, :id, :title, :description, :password, :closed
  json.url vote_url(vote, format: :json)
end
