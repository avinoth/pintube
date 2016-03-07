class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.text :description
      t.string :tags, array: true

      t.timestamps null: false
    end
  end
end
