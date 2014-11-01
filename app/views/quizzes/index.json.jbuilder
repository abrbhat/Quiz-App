json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :title, :view_count
  json.url quiz_url(quiz, format: :json)
end
