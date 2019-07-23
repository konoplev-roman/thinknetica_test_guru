class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :questions, dependent: :destroy

  validates :category, :author, :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :middle, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }

  def self.names_by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
