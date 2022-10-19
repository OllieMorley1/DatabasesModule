TRUNCATE TABLE students RESTART IDENTITY; 

INSERT INTO students (student_name, cohort_id) VALUES ('Student1', 1);
INSERT INTO students (student_name, cohort_id) VALUES ('Student3', 1);
INSERT INTO students (student_name, cohort_id) VALUES ('Student4', 1);
INSERT INTO students (student_name, cohort_id) VALUES ('Student2', 2);