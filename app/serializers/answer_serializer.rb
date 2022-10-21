class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :question, :body, :answered_by
end
