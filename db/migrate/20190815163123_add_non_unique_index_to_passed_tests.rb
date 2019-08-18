class AddNonUniqueIndexToPassedTests < ActiveRecord::Migration[5.2]
  def change
    add_index :passed_tests, [:user_id, :test_id]
  end
end
