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
    @test = @passed_test.test
  end

  def call
    Badge.select { |b| send("achieved_#{b.condition}?".to_sym, b.target) if CONDITIONS.include?(b.condition) }
  end

  private

  def achieved_success_by_category?(_target); end

  def achieved_success_by_level?(_target); end

  def achieved_success_first_attempt?(_target); end

  def achieved_without_errors?(test_id)
    return unless @test.id == test_id

    @passed_test.without_errors?
  end

  def achieved_success_all_tests?(_target); end

  def achieved_all_achievements?(_target); end
end
