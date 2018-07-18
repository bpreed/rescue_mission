class Question < ApplicationRecord
  validates :title, length: {minimum: 20}, presence: true
  validates :description, length: {minimum: 50}, presence: true
  has_many :answers, dependent: :destroy
end
