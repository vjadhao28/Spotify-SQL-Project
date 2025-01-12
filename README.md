# Spotify-SQL-Project

![image](https://github.com/user-attachments/assets/cff48d9e-c9ee-49b2-897a-fc8881186cc3)

Overview:

This project involves analyzing a Spotify dataset with various attributes about tracks, albums, and artists using SQL. It covers an end-to-end process of normalizing a denormalized dataset and performing SQL queries of varying complexity (easy, medium, and advanced). The primary goals of the project are to practice advanced SQL skills and generate valuable insights from the dataset.

Project Steps:

Data Exploration:

Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:

Artist: The performer of the track.

Track: The name of the song.

Album: The album to which the track belongs.

Album_type: The type of album (e.g., single or album).

Various metrics such as danceability, energy, loudness, tempo, and more.

Querying the Data:

After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into easy, medium, and advanced levels to help progressively develop SQL proficiency.

Easy Queries:

Simple data retrieval, filtering, and basic aggregations.

Medium Queries:

More complex queries involving grouping, aggregation functions, and joins.

Advanced Queries:

Nested subqueries, window functions, CTEs, and performance optimization.


15 Practice Questions:

Easy Level:

1. Retrieve the names of all tracks that have more than 1 billion streams.
   
2. List all albums along with their respective artists.

3.Get the total number of comments for tracks where licensed = TRUE.

4. Find all tracks that belong to the album type single.
  
5. Count the total number of tracks by each artist.

Medium Level:
1. Calculate the average danceability of tracks in each album.

2. Find the top 5 tracks with the highest energy values.

3. List all tracks along with their views and likes where official_video = TRUE.

4. For each album, calculate the total views of all associated tracks.

5. Retrieve the track names that have been streamed on Spotify more than YouTube.

Advanced Level:

1. Find the top 3 most-viewed tracks for each artist using window functions.

2. Write a query to find tracks where the liveness score is above the average.

3. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

Technology Stack:

1. Database: MYSQL

2. SQL Queries: DDL, DML, Aggregations, Joins, Subqueries, Window Functions



How to Run the Project:

1. Install MYSQL  (if not already installed).

2. Set up the database schema and tables using the provided normalization structure.

3. Insert the sample data into the respective tables.

4. Execute SQL queries to solve the listed problems.

Next Steps:

1. Visualize the Data: Use a data visualization tool like Tableau or Power BI to create dashboards based on the query results.

2. Expand Dataset: Add more rows to the dataset for broader analysis and scalability testing.

3. Advanced Querying: Dive deeper into query optimization and explore the performance of SQL queries on larger datasets.



