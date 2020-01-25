class AddPercentCorrectToPassedTest < ActiveRecord::Migration[5.2]
  def change
    add_column :passed_tests, :percent_correct, :integer, null: false, default: 0
  end
end
