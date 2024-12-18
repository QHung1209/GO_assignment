class Student < ApplicationRecord
  validates :sbd, presence: true, format: { with: /\A\d+\z/, message: "SBD must contain only numbers" }

  validates :toan, :ngu_van, :ngoai_ngu, :vat_li, :hoa_hoc, :sinh_hoc,
  :lich_su, :dia_li, :gdcd, numericality: true, allow_nil: true, 
  format: { with: /\A\d+\z/, message: "Score must contain only numbers" }

  validates :ma_ngoai_ngu, format: { with: /\A[a-zA-Z]+\d*\z/, message: "Must start with letters and may include numbers after" },
  allow_nil: true
end
