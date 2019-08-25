class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :gists

  validates :test, :body, presence: true
end
