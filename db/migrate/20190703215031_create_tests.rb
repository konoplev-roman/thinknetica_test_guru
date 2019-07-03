class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.integer :level

      t.timestamps
    end
  end
end
