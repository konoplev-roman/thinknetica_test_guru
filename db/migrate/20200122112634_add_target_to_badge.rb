class AddTargetToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :target, :integer
  end
end
