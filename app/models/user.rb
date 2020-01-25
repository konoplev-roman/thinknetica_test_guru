class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
  has_many :gists
  has_many :achievements, dependent: :destroy
  has_many :badges, through: :achievements

  validates :first_name, :last_name, presence: true

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def tests_by_level(level)
    tests.level(level)
  end

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
