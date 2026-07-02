# Healthcare Analysis — Messy Dataset

This project is a hands-on exploratory data analysis (EDA) practice using **SQL** and **Python** to work with a real-world-inspired *messy* healthcare dataset. It is part of my journey learning Data Science — documenting both the process and the lessons for myself and others.

## Dataset Overview

The dataset (`healthcare_dataset_messy.csv`) contains **203 patient records** with **13 columns**:

| Column | Description |
|---|---|
| `patient_id` | Unique patient identifier (e.g., `P1001`) |
| `first_name` | Patient first name |
| `last_name` | Patient last name |
| `age` | Patient age (numeric) |
| `gender` | Patient gender |
| `department` | Hospital department |
| `diagnosis` | Medical diagnosis |
| `admit_date` | Date of admission |
| `attending_doctor` | Doctor assigned to the patient |
| `insurance_provider` | Patient's insurance provider |
| `status` | Admission status (Admitted, Discharged, Outpatient, Pending) |
| `billing_amount` | Billing amount (numeric, sometimes with `$` prefix) |
| `phone` | Contact phone number |
| `email` | Email address |

## Known Data Quality Issues (Messiness)

This dataset was deliberately designed to be "messy" to simulate real-world data challenges. Issues identified so far:

### 1. Inconsistent Categorical Values
- **Gender**: Mixed cases and abbreviations — `male`, `Male`, `female`, `Female`, `F`, `Unknown`, `Uknown`
- **Department**: Inconsistent capitalization — e.g., `cardiology` vs `Cardiology`
- **Status**: Inconsistent formatting — `admitted`, `Admitted`, `DISCHARGED`, `Discharged`, `Outpatient`, `Pending`
- **Insurance Provider**: Mix of spelled-out names (`Medicare`, `Medicaid`, `BlueCross`) and `N/A`, plus empty values

### 2. Missing / Null Values
- Missing `gender`, `age`, `department`, `diagnosis`, `insurance_provider`, `status`, `attending_doctor` entries

### 3. Date Format Inconsistencies
- **Multiple formats** in the same column:
  - `"  Jan 07, 2024 "` (with leading/trailing spaces)
  - `11-11-2025` (DD-MM-YYYY)
  - `10/13/2021` (MM/DD/YYYY)
  - `2025-12-05` (ISO YYYY-MM-DD)
  - `"Nov 05, 2019"` (Mon DD, YYYY with quotes)

### 4. Numeric / Value Anomalies
- **Age**: Contains an impossible value (`999`), a 4-year-old patient, and empty cells
- **Billing amount**: Some values prefixed with `$` (stored as string), some columns appear to be swapped with `status`

### 5. Column Misalignment
- Certain rows appear to have values shifted between columns (e.g., `billing_amount` and `status` swapped)

### 6. Phone Number Formatting
- Mix of formatted (`206-507-4635`) and unformatted (`8386062676`) phone numbers

## SQL Analysis (`analysis1.sql`)

The SQL file documents exploratory queries run against the dataset, including:

- **Filtering** — Listing patients by name, gender, age criteria
- **Counting & Aggregation** — Gender distribution, patient count per doctor, insurance provider frequency
- **Missing Data Detection** — Finding rows with `NULL` or empty `age`, `gender`
- **Duplicate Detection** — Checking for duplicate records using `GROUP BY` and `HAVING COUNT(*) > 1`
- **Top N Analysis** — Finding the insurance provider with the most patients
- **Column Inspection** — Listing distinct values for key columns

## Tools & Technologies

- **SQL** (MySQL) — Data querying, cleaning, and exploration
- **Python / Jupyter** — Planned for deeper EDA and visualization
  - Libraries: `pandas`, `numpy`
- **CSV** — Raw data storage format

## Goals

- [x] Load and inspect the messy dataset
- [x] Run exploratory SQL queries
- [x] Identify data quality issues
- [ ] Clean the dataset using SQL and Python
- [ ] Visualize insights (patient demographics, department workload, insurance distribution, etc.)
- [ ] Document findings for future reference

## How to Use

1. **SQL Analysis** — Import the CSV into a MySQL database and run the queries in `analysis1.sql`.
2. **Python EDA** — Open `student_data.ipynb` (intro-level) as a reference, and extend with notebooks focused on this healthcare dataset.

---

> *This project is part of my self-taught Data Science journey. Feel free to fork, learn, and contribute!*
