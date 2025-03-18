#!/bin/bash

# Variables
dB_NAME="app"
DB_USER="ituser"
NEW_ADMIN_USER="admin_cee"
DUMP_FILE="/tmp/app.dump"
LOG_FILE="/tmp/query_results.log"

echo "Creating database..."
psql -U $DB_USER -c "CREATE DATABASE $DB_NAME;"

echo "Creating new admin user '$NEW_ADMIN_USER'..."
psql -U $DB_USER -d $DB_NAME -c "CREATE USER $NEW_ADMIN_USER WITH SUPERUSER PASSWORD 'secure_password';"

echo "Importing dataset from backup..."
pg_restore -U $DB_USER -d $DB_NAME $DUMP_FILE

echo "Running queries and saving results..."
{
  echo "Total number of employees:"
  psql -U $DB_USER -d $DB_NAME -c "SELECT COUNT(*) AS total_employees FROM employees;"

  echo "\nEmployees in a specified department (IT example):"
  psql -U $DB_USER -d $DB_NAME -c "
    SELECT first_name, last_name
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_name = 'IT';"

  echo "\nHighest and lowest salaries per department:"
  psql -U $DB_USER -d $DB_NAME -c "
    SELECT d.department_name,
           MAX(s.salary) AS highest_salary,
           MIN(s.salary) AS lowest_salary
    FROM employees e
    JOIN salaries s ON e.employee_id = s.employee_id
    JOIN departments d ON e.department_id = d.department_id
    GROUP BY d.department_name;"
} > $LOG_FILE

echo "Process complete. Results are saved in: $LOG_FILE"

