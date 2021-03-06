class Badge < ApplicationRecord
  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements

  validates :title, :condition, :image, presence: true
  validates :target, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true, if: :need_target?
  validates :target, numericality: { only_integer: true, greater_than: 0 }, allow_nil: false, unless: :need_target?
  validates :condition, uniqueness: { scope: :target }, inclusion: { in: AchievementService::CONDITIONS }

  scope :target, ->(target) { where(target: target) }

  def self.uniq_ids
    distinct.order(id: :asc).pluck(:id)
  end

  def need_target?
    AchievementService::CONDITIONS_WITHOUT_TARGET.include?(condition)
  end
end
