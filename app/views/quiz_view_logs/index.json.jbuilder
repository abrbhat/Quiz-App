json.array!(@quiz_view_logs) do |quiz_view_log|
  json.extract! quiz_view_log, :id, :quiz_id, :viewer_id
  json.url quiz_view_log_url(quiz_view_log, format: :json)
end
