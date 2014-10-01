json.array!(@resources) do |resource|
  json.extract! resource, :id, :res_name, :res_uri, :res_uri, :res_desc, :respacket_id_id
  json.url resource_url(resource, format: :json)
end
