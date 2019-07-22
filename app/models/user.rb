class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def tests_by_level(level)
    tests.where(level: level)
  end
end
