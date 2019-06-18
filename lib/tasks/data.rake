task :environment

namespace :data do
  desc "Create Sample User"
  task :create_sample_users => :environment do
    Sample.create_users
  end

  desc "Create Sample School"
  task :create_sample_schools => :environment do
    Sample.create_schools
  end

  desc "Create Sample Student"
  task :create_sample_students => :environment do
    Sample.create_students
  end


  desc "Create Sample Student Performance"
  task :create_sample_student_performances => :environment do
    Sample.create_student_performances
  end

end
