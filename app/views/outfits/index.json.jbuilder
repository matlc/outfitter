json.array!(@outfits) do |outfit|
  json.extract! outfit, :id, :name
  json.url outfit_url(outfit, format: :json)
end
