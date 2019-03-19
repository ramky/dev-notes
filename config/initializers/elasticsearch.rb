client = Elasticsearch::Client.new(host: 'db.ram-iyer.com', port: 80) do |f|
  f.basic_auth(ENV['ES_USER'], ENV['ES_PASSWORD'])
end
Elasticsearch::Model.client = client
