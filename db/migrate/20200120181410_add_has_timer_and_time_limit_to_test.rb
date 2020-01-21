class AddHasTimerAndTimeLimitToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :has_timer, :boolean, null: false, default: false
    add_column :tests, :time_limit, :integer
  end
end
