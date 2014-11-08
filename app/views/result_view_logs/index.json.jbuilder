json.array!(@result_view_logs) do |result_view_log|
  json.extract! result_view_log, :id, :result_id, :viewer_id
  json.url result_view_log_url(result_view_log, format: :json)
end
