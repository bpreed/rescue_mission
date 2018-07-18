class Answer < ApplicationRecord
  validates :description, length: {minimum: 50}, presence: true
  belongs_to :question
end
