json.array!(@questions) do |question|
  json.extract! question, :id, :title, :quiz_id, :view_count
  json.url question_url(question, format: :json)
end
