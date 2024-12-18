require 'csv'
require 'activerecord-import/base'

csv_file_path = "db/data/diem_thi_thpt_2024.csv"

students = []

CSV.foreach(csv_file_path, headers: true) do |row|
  students << Student.new(
    sbd: row['sbd'],
    toan: row['toan'],
    ngu_van: row['ngu_van'],
    ngoai_ngu: row['ngoai_ngu'],
    vat_li: row['vat_li'],
    hoa_hoc: row['hoa_hoc'],
    sinh_hoc: row['sinh_hoc'],
    lich_su: row['lich_su'],
    dia_li: row['dia_li'],
    gdcd: row['gdcd'],
    ma_ngoai_ngu: row['ma_ngoai_ngu']
  )
end

Student.import students
