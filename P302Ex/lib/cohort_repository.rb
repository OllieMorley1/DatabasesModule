require_relative 'cohort'
require_relative 'student'

class CohortRepository 
    def all
    end

    def find(id)
    end

    def find_with_students(id)
        sql = 'SELECT cohorts.cohort_name, students.student_name 
        FROM cohorts
        JOIN students ON cohorts.id = students.cohort_id
        WHERE cohort_id = $1'
        sql_params = [id]

        result = DatabaseConnection.exec_params(sql, sql_params)
        cohort = Cohort.new
        cohort.id = result.first['id']
        cohort.cohort_name = result.first['cohort_name']
        cohort.start_date = result.first['start_date']

        result.each do |record|
            student = Student.new
            student.id = record['id']
            student.student_name = record['student_name']
            student.cohort_id = record['cohort_id']

            cohort.students << student
        end
        
        return cohort

    end

    # def create(account)
    # end

    # def delete(id)
    # end

    # def update(account)
    # end
end