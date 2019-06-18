class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :sex, null: false
      t.date :date_of_birth

      t.timestamps
    end
  end
end
