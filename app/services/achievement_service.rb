class AchievementService
  CONDITIONS_WITH_TARGET = %w[
    success_by_category
    success_by_level
    success_first_attempt
    without_errors
  ].freeze

  CONDITIONS_WITHOUT_TARGET = %w[
    all_achievements
  ].freeze

  CONDITIONS = CONDITIONS_WITH_TARGET + CONDITIONS_WITHOUT_TARGET
end
