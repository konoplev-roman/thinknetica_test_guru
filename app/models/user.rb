class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  validates :name, presence: true

  def tests_by_level(level)
    tests.level(level)
  end

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
