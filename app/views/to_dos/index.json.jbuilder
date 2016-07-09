json.array!(@to_dos) do |to_do|
  json.extract! to_do, :id, :category, :completed
  json.url to_do_url(to_do, format: :json)
end
