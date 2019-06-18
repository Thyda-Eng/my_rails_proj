module Api::V1
  class StudentPerformancesController < ApplicationController
    def show
      result = StudentPerformance.where(school_year: params[:school_year], student_id: params[:student_id])
      render json: {result: result}
    end

  end
end
