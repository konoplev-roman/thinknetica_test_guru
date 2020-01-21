class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.text :image, null: false
      t.string :condition, null: false

      t.timestamps
    end
  end
end
