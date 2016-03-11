class AddUniqueIndexToBoardName < ActiveRecord::Migration
  def change
    change_column_null :boards, :name, false
    add_index :boards, :name, unique: true
  end
end
