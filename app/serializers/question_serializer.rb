class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body
end
