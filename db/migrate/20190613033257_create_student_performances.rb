class CreateStudentPerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :student_performances do |t|
      t.references :student, foreign_key: true
      t.string :grade
      t.string :school_year
      t.string :subject
      t.integer :semester

      t.timestamps
    end
  end
end
