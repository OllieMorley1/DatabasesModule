As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

## 1.List all the nouns
student, student_name, cohort_name, start_date

## 2.Decide whether a noun is a record (a table name) or a property of it (a column).
students: student_name, cohort_name
cohorts: cohort_name, start_date

## 3.Decide the column types.
students: student_name (text), cohort_name (text)
cohorts: cohort_name(text), start_date(date)

## 4.Decide how the two tables will be related (where the foreign key is needed).
cohort_name will be fk

## 5.Write the SQL to create the tables.
CREATE TABLE cohorts(
    id SERIAL PRIMARY KEY,
    cohort_name text
    start_date date
);

CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    student_name text,
    cohort_id int,
    constraint fk_cohort foreign key(cohort_id) references cohorts(id)
);


; rvm use ruby --latest --install --default
; gem install bundler
; bundle init
; bundle add rspec
; rspec --init
; mkdir lib
; bundle add pg
; touch lib/database_connection.rb
; touch spec/seeds.sql
; touch app.rb