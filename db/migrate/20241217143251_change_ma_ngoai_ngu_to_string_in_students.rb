class ChangeMaNgoaiNguToStringInStudents < ActiveRecord::Migration[8.0]
  def change
    change_column :students, :ma_ngoai_ngu, :string
  end
end
