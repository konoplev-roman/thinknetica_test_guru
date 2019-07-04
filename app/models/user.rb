class User < ApplicationRecord
  def tests_by_level(level)
    Test
      .joins('JOIN passed_tests ON tests.id = passed_tests.test_id')
      .where('passed_tests.user_id' => id, 'tests.level' => level)
  end
end
