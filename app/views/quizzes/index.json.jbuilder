json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :user_id, :question, :option1, :option2, :option3, :option4, :answer
  json.url quiz_url(quiz, format: :json)
end
