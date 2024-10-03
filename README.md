# MoviesDatabaseSQL

# Movie Recommendation Database

## Overview
This project focuses on designing and implementing a **movie recommendation database**. The database stores information on **movies, genres, users, ratings, and tags**. The goal is to create the database schema, populate it with data, and execute SQL queries to retrieve insights such as movie ratings and genre-specific statistics.


## ER DIagram 
![Alt text](ER_diagram.png)

## Database Tables
The database includes the following tables:

- **users**: Stores user information (`userid`, `name`).
- **movies**: Stores movie details (`movieid`, `title`).
- **taginfo**: Stores tags used by users (`tagid`, `content`).
- **genres**: Stores movie genres (`genreid`, `name`).
- **ratings**: Logs user ratings of movies (`userid`, `movieid`, `rating`, `timestamp`).
- **tags**: Logs user tags on movies (`userid`, `movieid`, `tagid`, `timestamp`).
- **hasagenre**: Links movies to genres (`movieid`, `genreid`).

## SQL Queries
The project involves writing SQL queries to generate insights:

1. **Total number of movies per genre** (`query1`).
2. **Average rating per genre** (`query2`).
3. **Movies with at least 10 ratings** (`query3`).
4. **List of all Comedy movies** (`query4`).
5. **Average rating per movie** (`query5`).
6. **Average rating for Comedy movies** (`query6`).
7. **Average rating for movies that are both Comedy and Romance** (`query7`).
8. **Average rating for Romance movies that are not Comedy** (`query8`).
9. **Movies rated by a specific user** (`query9`).

## How to Use

1. **Create Tables**: Define schema and constraints.
2. **Load Data**: Populate tables with data.
3. **Run Queries**: Execute the SQL queries to generate result tables.

