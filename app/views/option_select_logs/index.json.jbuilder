json.array!(@option_select_logs) do |option_select_log|
  json.extract! option_select_log, :id, :option_id, :viewer_id
  json.url option_select_log_url(option_select_log, format: :json)
end
