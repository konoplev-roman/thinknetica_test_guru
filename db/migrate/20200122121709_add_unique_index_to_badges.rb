class AddUniqueIndexToBadges < ActiveRecord::Migration[5.2]
  def change
    add_index :badges, [:condition, :target], unique: true
  end
end
