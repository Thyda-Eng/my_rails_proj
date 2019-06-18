class StudentPerformancesController < ApplicationController
  def index
    performances = apply_filter(params)
    @student_performances = performances.select(:student_id, :school_year, :grade).distinct
  end

  def new
    @student_performance = StudentPerformance.new
  end

  def create
    student_performance = StudentPerformance.create(student_performance_params)

    redirect_to root_path
  end

  def show

  end

  def performance_graph
    @students = Student.where(school_id: params[:school_id]) || []
    if params[:student_id] && params[:student_id] != ""
      @student = Student.find(params[:student_id])
      @total_score = StudentPerformance.where(student_id: params[:student_id], school_year: params[:school_year]).sum(:score)
      @status = ((@total_score*100)/60 > 60) ?  "Pass" : "Fail"
    end
    @performances = apply_filter(params)
  end

  private
  def student_performance_params
    # params.require(:student_performance).permit(:school_year, :student_id, :grade)
  end

  def apply_filter(params)
    performances = StudentPerformance.all

    if(params[:school_id] && params[:school_id] != "")
      performances = StudentPerformance.joins(:student).where("students.school_id = #{params[:school_id]}")
    end

    if(params[:school_year] && params[:school_year] != "")
      performances = performances.where(school_year: params[:school_year])
    end

    if(params[:grade] && params[:grade] != "")
      performances = performances.where(grade: params[:grade])
    end

    if(params[:student_id] && params[:student_id] != "")
      performances = performances.where(student_id: params[:student_id])
    end

    return performances
  end
end
