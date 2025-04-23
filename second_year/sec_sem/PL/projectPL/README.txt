# University Schedule Planner

A Prolog-based system for generating optimal university schedules.

## Requirements
- SWI-Prolog 8.0 or later
- SQLite3

## Installation
1. Clone the repository
2. Initialize the database:
   ```bash
   sqlite3 university_schedule.db < database/schema.sql
   sqlite3 university_schedule.db < database/seeds.sql