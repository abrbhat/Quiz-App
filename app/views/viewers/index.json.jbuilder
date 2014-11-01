json.array!(@viewers) do |viewer|
  json.extract! viewer, :id, :name, :quizzes_viewed, :questions_viewed
  json.url viewer_url(viewer, format: :json)
end
