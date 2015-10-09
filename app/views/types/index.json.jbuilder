json.array!(@types) do |type|
  json.extract! type, :id, :code, :additional1, :additional2
  json.url type_url(type, format: :json)
end
