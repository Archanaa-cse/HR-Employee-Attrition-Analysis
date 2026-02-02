**HR-Employee-Attrition-Analysis**

Analyzing employee attrition using Python, SQL, and Power BI

**Data Source**

The dataset used in this project is from IBM HR Analytics Employee Attrition & Performance.
Source: IBM HR Analytics Dataset
The data has been converted to CSV and cleaned for analysis.

**Workflow**

Convert Excel data to CSV.

Clean and preprocess data using Python (src/HR_Employee_Attrition_Analysis.ipynb).

Load cleaned data into SQL (sql/HR_Employee_Attrition.sql).

Run SQL queries to filter and analyze employee attrition.

Connect SQL to Power BI and create interactive dashboards (PowerBI/Hr_attrition.pbix).

**Instructions to Run**

Python

Install required packages:

pip install pandas numpy sqlalchemy

Run Jupyter Notebook for data cleaning:

jupyter notebook src/HR_Employee_Attrition_Analysis.ipynb

SQL

Execute the SQL script in your database:

sql/HR_Employee_Attrition.sql

Power BI

Open the Power BI dashboard:

PowerBI/Hr_attrition.pbix

**Project Structure**

HR-Employee-Attrition-Analysis/

│
├─ src/

│   └─ HR_Employee_Attrition_Analysis.ipynb   # Data cleaning and preprocessing

│
├─ sql/

│   └─ HR_Employee_Attrition.sql             # SQL queries for analysis

│
├─ PowerBI/

│   └─ Hr_attrition.pbix                      # Interactive dashboard

│
└─ README.md                                 # Project documentation
