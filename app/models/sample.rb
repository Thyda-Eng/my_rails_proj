class Sample
  def self.create_users
    5.times.each do |i|
      User.create(username: "user_#{i+1}", password: 'password')
    end
  end

  def self.create_schools
    3.times.each do |i|
      School.create(school_code: "school_#{i+1}", school_name: "School #{i+1}")
    end
  end

  def self.create_students
    index = 1
    School.all.each do |school|
      4.times.each do |i|
        Student.create(student_id: "stu_#{index}", name: "Student #{index}", sex: 'F', school_id: school.id)
        index = index + 1
      end
    end
  end

  def self.create_student_performances
    School.all.each do |school|
      school.students.each do |student|
        StudentPerformance::SEMESTER.each do |semester|
          StudentPerformance::SUBJECT.each do |subject|
            StudentPerformance.create(student_id: student.id, grade: 4, school_year: "2018-2019", subject: subject, semester: semester, score: rand(0..10))
          end
        end
      end
    end
  end

end
