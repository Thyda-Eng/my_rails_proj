class AddScoreToStudentPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :student_performances, :score, :decimal
  end
end
