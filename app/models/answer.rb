class Answer < ApplicationRecord
  belongs_to :answered_by, class_name: 'User', foreign_key: :user_id

  validates :user_id, presence: true
end
