class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.integer :board_id, null: false
      t.integer :video_id, null: false

      t.timestamps null: false
    end

    add_index :groupings, [:board_id, :video_id], unique: true
  end
end
