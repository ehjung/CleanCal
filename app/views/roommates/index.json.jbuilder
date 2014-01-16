json.array!(@roommates) do |roommate|
  json.extract! roommate, :id, :name
  json.url roommate_url(roommate, format: :json)
end
