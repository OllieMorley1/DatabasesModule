require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository'

DatabaseConnection.connect('student_directory_2')

cohort = CohortRepository.new
cohort1 = cohort.find_with_students(1)
students = []

cohort1.students.each do |x|
    students << x.student_name
end

puts students
#print out 1 cohort and its students
