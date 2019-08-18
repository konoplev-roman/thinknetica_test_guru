class RemoveUniqueIndexFromPassedTests < ActiveRecord::Migration[5.2]
  def change
    remove_index :passed_tests, [:user_id, :test_id]
  end
end
