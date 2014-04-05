json.array!(@methodologies) do |methodology|
  json.extract! methodology, :id, :title, :content, :user_id
  json.url methodology_url(methodology, format: :json)
end
