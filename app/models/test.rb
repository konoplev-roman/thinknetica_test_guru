class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :questions, dependent: :destroy

  validates :category, :author, :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }

  validates :has_timer, inclusion: { in: [true, false] }
  validates :time_limit, numericality: { only_integer: true, greater_than: 0 }, if: :timer?

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :middle, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }

  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }) }
  scope :sort_by_title, -> { order(title: :desc) }

  def self.names_by_category(category)
    by_category(category).sort_by_title.pluck(:title)
  end

  def timer?
    has_timer
  end
end
