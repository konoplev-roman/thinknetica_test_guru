class Badge < ApplicationRecord
  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements

  validates :title, :condition, :image, presence: true
  validates :target, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :condition, uniqueness: { scope: :target }, inclusion: { in: AchievementService::CONDITIONS }

  scope :target, ->(target) { where(target: target) }
end
