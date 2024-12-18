class CreateStudentScoresView < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      CREATE VIEW student_scores AS
      SELECT id,
             GREATEST(toan, ngu_van, ngoai_ngu, vat_li, hoa_hoc, sinh_hoc, lich_su, dia_li, gdcd) AS max_score,
             LEAST(toan, ngu_van, ngoai_ngu, vat_li, hoa_hoc, sinh_hoc, lich_su, dia_li, gdcd) AS min_score
      FROM students;
    SQL
  end
end
