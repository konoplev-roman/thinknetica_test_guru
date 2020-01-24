class AchievementService
  CONDITIONS_WITH_TARGET = %w[
    success_by_category
    success_by_level
    success_first_attempt
    without_errors
  ].freeze

  CONDITIONS_WITHOUT_TARGET = %w[
    success_all_tests
    all_achievements
  ].freeze

  CONDITIONS = CONDITIONS_WITH_TARGET + CONDITIONS_WITHOUT_TARGET

  def initialize(passed_test)
    @passed_test = passed_test
    @user = @passed_test.user
    @test = @passed_test.test
  end

  def call
    Badge.select { |b| send("achieved_#{b.condition}?".to_sym, b) if CONDITIONS.include?(b.condition) }
  end

  private

  def achieved_success_by_category?(badge)
    return unless @passed_test.success? && @test.category_id == badge.target

    # IDs of all tests in a category must match the IDs of success completed tests in the same category
    necessary_condition = Test.where(category_id: badge.target).uniq_ids
    fulfilled_condition = success_completed_tests_after(badge).by_category(badge.target).uniq_test_ids

    necessary_condition == fulfilled_condition
  end

  def achieved_success_by_level?(badge)
    return unless @passed_test.success? && @test.level == badge.target

    # IDs of all tests in a level must match the IDs of success completed tests in the same level
    necessary_condition = Test.level(badge.target).uniq_ids
    fulfilled_condition = success_completed_tests_after(badge).by_level(badge.target).uniq_test_ids

    necessary_condition == fulfilled_condition
  end

  def achieved_success_first_attempt?(badge)
    return unless @passed_test.success? && @test.id == badge.target

    # Only one record of passing this test should be found
    @user.passed_tests.where(test_id: badge.target).one?
  end

  def achieved_without_errors?(badge)
    return unless @passed_test.success? && @test.id == badge.target

    # All answers must be correct
    @passed_test.without_errors?
  end

  def achieved_success_all_tests?(badge)
    return unless @passed_test.success?

    # IDs of all tests must match the IDs of success completed tests
    necessary_condition = Test.uniq_ids
    fulfilled_condition = success_completed_tests_after(badge).uniq_test_ids

    necessary_condition == fulfilled_condition
  end

  def achieved_all_achievements?(badge)
    return unless @passed_test.success?

    # IDs of all badges without the "all_achievements" badge ID
    necessary_condition = Badge.uniq_ids - [badge.id]
    fulfilled_condition = achievements_after(badge).uniq_badge_ids

    necessary_condition == fulfilled_condition
  end

  def success_completed_tests_after(badge)
    achievement = find_last_achievement(badge)

    return @user.passed_tests.success_completed.after(achievement.created_at) if achievement

    @user.passed_tests.success_completed
  end

  def achievements_after(badge)
    achievement = find_last_achievement(badge)

    return @user.achievements.after(achievement.created_at) if achievement

    @user.achievements
  end

  def find_last_achievement(badge)
    @user.achievements.where(badge_id: badge.id).order(created_at: :asc).last
  end
end
