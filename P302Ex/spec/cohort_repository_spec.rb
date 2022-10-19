require 'cohort_repository'

def reset_cohorts_table
    seed_sql = File.read('spec/cohorts_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
    connection.exec(seed_sql)
  end

def reset_students_table
    seed_sql = File.read('spec/students_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
    connection.exec(seed_sql)
  end 

RSpec.describe CohortRepository do

        before(:each) do 
        reset_cohorts_table
        reset_students_table
        end

it 'finds artist 1 with related albums' do
    repository = CohortRepository.new
    cohort = repository.find_with_students(1)

    expect(cohort.cohort_name).to eq('Sep22')
    expect(cohort.students.length).to eq(3)
  end
end