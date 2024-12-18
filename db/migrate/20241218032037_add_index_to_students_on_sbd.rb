class AddIndexToStudentsOnSbd < ActiveRecord::Migration[8.0]
  def change
    add_index :students, :sbd
  end
end