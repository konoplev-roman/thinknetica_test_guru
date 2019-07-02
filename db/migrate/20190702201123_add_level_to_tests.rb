class AddLevelToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :level, :integer, default: 0
  end
end
