json.array!(@options) do |option|
  json.extract! option, :id, :title, :question, :selection_count
  json.url option_url(option, format: :json)
end
