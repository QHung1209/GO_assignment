class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def find_student
  end

  def dashboard
  end

  def report
  end


  def FindBySBD
    @student = Student.find_by(sbd: params[:sbd])

    if @student
      render :find_student
    else
      @error = 'Không tìm thấy'
      render :find_student
    end
  end


  def StatisticsScore
    @lv1, @lv2, @lv3, @lv4 = Rails.cache.fetch("statistics_score", expires_in: 1.hour) do
      lv1 = Student.where('toan >= 8 OR ngu_van >= 8 OR ngoai_ngu >= 8 OR vat_li >= 8 OR hoa_hoc >= 8 OR sinh_hoc >= 8 OR lich_su >= 8 OR dia_li >= 8 OR gdcd >= 8').count

      lv2 = Student.where('toan >= 6 AND toan < 8 OR ngu_van >= 6 AND ngu_van < 8 OR ngoai_ngu >= 6 AND ngoai_ngu < 8 OR vat_li >= 6 AND vat_li < 8 OR hoa_hoc >= 6 AND hoa_hoc < 8 OR sinh_hoc >= 6 AND sinh_hoc < 8 OR lich_su >= 6 AND lich_su < 8 OR dia_li >= 6 AND dia_li < 8 OR gdcd >= 6 AND gdcd < 8').count

      lv3 = Student.where('toan >= 4 AND toan < 6 OR ngu_van >= 4 AND ngu_van < 6 OR ngoai_ngu >= 4 AND ngoai_ngu < 6 OR vat_li >= 4 AND vat_li < 6 OR hoa_hoc >= 4 AND hoa_hoc < 6 OR sinh_hoc >= 4 AND sinh_hoc < 6 OR lich_su >= 4 AND lich_su < 6 OR dia_li >= 4 AND dia_li < 6 OR gdcd >= 4 AND gdcd < 6').count

      lv4 = Student.where('toan < 4 OR ngu_van < 4 OR ngoai_ngu < 4 OR vat_li < 4 OR hoa_hoc < 4 OR sinh_hoc < 4 OR lich_su < 4 OR dia_li < 4 OR gdcd < 4').count
      [lv1, lv2, lv3, lv4]
    end
    @chart_data = [
    ["Excellent (8+)", @lv1],
    ["Good (6-7.9)", @lv2],
    ["Average (4-5.9)", @lv3],
    ["Poor (<4)", @lv4]
    ]
    render :report
  end

  def Top10GroupA
    @top_10_students = Rails.cache.fetch("top_10_group_A", expires_in: 1.hour) do
      Student
      .select('sbd, toan, ngu_van, ngoai_ngu, vat_li, hoa_hoc, (toan + vat_li + hoa_hoc) AS total_score')
      .where('toan > ? AND vat_li > ? AND hoa_hoc > ?', 8, 8, 8)
      .order('total_score DESC')
      .limit(10)
    end

    if @top_10_students
      render :dashboard
    else
      @error = 'Không tìm thấy'
      render :dashboard
    end
  
    
  end

end
