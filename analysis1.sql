use data_analysis;
show tables;
select * from healthcare_dataset_messy where first_name = 'Christopher'; -- listing down all the people whose firs_names are Christopher
select * from healthcare_dataset_messy where gender = 'male'; -- listing all the male in our data set bearing in mind that some daata is missing from our entries
select COUNT(*) from healthcare_dataset_messy where gender = 'male'; -- counting all the male in our dataset bearing in mind that some data is missing from our entries
-- The total males is 15
-- counting  the number of females in our dataset
select COUNT(*) from healthcare_dataset_messy where gender = 'Female'; -- The total females is 13
-- findng the patients with the uknown genders from the dataset
SELECT * FROM healthcare_dataset_messy  WHERE  gender = 'Uknown';
--
-- finding the duplicates
SELECT first_name, last_name, COUNT(*)
FROM users
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;
-- The above we have tried finding duplicates with reference to the first_name and last_name columns

SELECT * FROM healthcare_dataset_messy WHERE age IS NULL;  -- Assuming the age is numeric this is the query we use
SELECT * FROM healthcare_dataset_messy WHERE age = ''; -- Assuming the age is a string we use the same approach but we use the 2 literal strings
SELECT DISTINCT age  FROM healthcare_dataset_messy ORDER BY age;  -- checks how the age colum storage is
SELECT COUNT(*) from healthcare_dataset_messy WHERE age IS NULL; -- shows that the age column is fully populated
SHOW COLUMNS FROM healthcare_dataset_messy;  -- listing the columns of our dataset
 SELECT *, COUNT(*) AS count
  FROM healthcare_dataset_messy
  GROUP BY patient_id, first_name, last_name, age, gender,
           department, diagnosis, admit_date, attending_doctor,
           insurance_provider, status, billing_amount, phone, email
  HAVING COUNT(*) > 1;  -- This query goes ahead to list all the duplicates that we have using the Groupby and having classes
  -- THere are no duplicates in the dataset
SELECT * FROM healthcare_dataset_messy where age>18; -- making an assumption that the dataset is from kenya this is the aproach i would take to list the adults in our dataset
SELECT DISTINCT attending_doctor FROM healthcare_dataset_messy ORDER BY attending_doctor; -- This query lists all the attending doctors
  SELECT attending_doctor, COUNT(*) AS count
  FROM healthcare_dataset_messy
  GROUP BY attending_doctor
  ORDER BY attending_doctor;
-- The above query lists the doctors and the number of attended sesseions
SELECT distinct insurance_provider FROM healthcare_dataset_messy ORDER BY insurance_provider; -- This query lists down the insurance providers from the dataset
SELECT insurance_provider, COUNT(*) AS count
FROM healthcare_dataset_messy GROUP BY insurance_provider
ORDER by insurance_provider; -- counting and listing and counting the number of patients the insurance provider has
SELECT insurance_provider, COUNT(*) AS count
FROM healthcare_dataset_messy GROUP BY insurance_provider
ORDER BY count DESC
LIMIT 1;  -- finds the insurance with the Highest number of patients
show columns from healthcare_dataset_messy;
-- status checking of the data
SELECT * FROM healthcare_dataset_messy WHERE status = 'admitted'; -- This allows the listing the admitted patients
SELECT * FROM healthcare_dataset_messy WHERE status = 'Discharged'; -- displays the discharged patients alone
 -- focuing on the billing amount
SELECT *
FROM healthcare_dataset_messy
WHERE billing_amount = (
    SELECT MAX(billing_amount)
    FROM healthcare_dataset_messy
); -- THis query displays the patient with the highest bill and in the case it is ERIca ROBerTSon
 -- phone number
 -- In this case i will focus on the patient with a  missing phone number
 SELECT * FROM healthcare_dataset_messy WHERE phone = ''; -- This query shows the phone number that is empty

 -- focusing on the email
 SELECT * FROM healthcare_dataset_messy WHERE email = ''; -- displays the email of the patients whose email is ot recorded
