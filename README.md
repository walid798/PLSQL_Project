# PLSQL_Project
This Repo contains a project about Dynamic SQL Sequences and Triggers in PL/SQL

# Dynamic SQL Sequences and Triggers in PL/SQL

This repository showcases a **PL/SQL project** This project is a deliverable for the Advanced PL/SQL course as part of the Data Visualization track at the Information Technology Institute (ITI). It demonstrates the practical application of advanced PL/SQL concepts, including dynamic SQL, triggers, and database automation.

---

## Features
- **Dynamic SQL**: Automatically creates sequences and triggers for numeric primary key columns.
- **Automation**: Eliminates the need for manual sequence and trigger creation.
- **Error-Free Execution**: Uses robust dynamic SQL with proper validation.
- **Reusability**: Can be used across multiple schemas with numeric primary keys.

---

## Repository Structure

- **`scripts/`**: Contains the main PL/SQL script and supporting setup scripts.
- **`docs/`**: Documentation and usage guides for the project.
- **`examples/`**: Sample input/output and test cases for reference.

---

## How It Works

1. **Identify Tables**:
   - Scans all tables in the schema for numeric primary keys with constraints.

2. **Drop Old Sequences**:
   - Drops all existing sequences in the schema for cleanup.

3. **Create New Sequences**:
   - Dynamically generates new sequences for primary key columns starting from the current maximum value in the table.

4. **Create Triggers**:
   - Adds a `BEFORE INSERT` trigger to auto-generate primary key values using the newly created sequence.

---

## Requirements

- **Oracle Database**: Version 11g or later.
- **PL/SQL Developer or SQL*Plus**: To execute the scripts.

---

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/PLSQL_PROJECT.git
   cd PLSQL_PROJECT
