Create database Spotify;
use spotify;
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;



LOAD DATA LOCAL INFILE "E:/ExcelR/Project/SQL Project/Spotify/cleaned_dataset.csv"
INTO TABLE spotify
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from spotify;

select count(*) from spotify;


select count(distinct artist) from spotify;

select count(distinct album_type) from spotify;

select count(distinct artist) from spotify;

select max(duration_min) from spotify;
select min(duration_min) from spotify;

select * from spotify
where duration_min = 0;

select distinct channel from spotify;

select distinct most_played_on from spotify;


/*
--------------------------------------------
Easy Level
--------------------------------------------
# Retrieve the names of all tracks that have more than 1 billion streams.
# List all albums along with their respective artists.
# Get the total number of comments for tracks where licensed = TRUE.
# Find all tracks that belong to the album type single.
# Count the total number of tracks by each artist.
*/

# Q.1 Retrieve the names of all tracks that have more than 1 billion streams.
select * from spotify
where stream > 1000000000;

# Q.2 List all albums along with their respective artists.
select
distinct album,
artist
from spotify
order by 1;

select
distinct album
from spotify
order by 1;

# Q.3 Get the total number of comments for tracks where licensed = TRUE.
select
sum(comments) as total_comments
from spotify
where licensed = 'true';

# Q.4 Find all tracks that belong to the album type single.
select * from spotify
where album_type = 'single';

# Q.5 Count the total number of tracks by each artist.
select
artist,
count(*) as total_no_songs
from spotify
group by artist
order by 2;

/*
--------------------------------------------
Medium Level
--------------------------------------------
# Calculate the average danceability of tracks in each album.
# Find the top 5 tracks with the highest energy values.
# List all tracks along with their views and likes where official_video = TRUE.
# For each album, calculate the total views of all associated tracks.
# Retrieve the track names that have been streamed on Spotify more than YouTube.
*/

# Q.6 Calculate the average danceability of tracks in each album.
select
album,
avg(danceability) as avg_danceability
from spotify
group by 1
order by 2 desc;

# Q.7 Find the top 5 tracks with the highest energy values.
select
track,
max(energy)
from spotify
group by 1
order by 2 desc
limit 5;

# Q.8 List all tracks along with their views and likes where official_video = TRUE.
select
track,
sum(views) as total_views,
sum(likes) as total_likes
from spotify
where official_video = 'true'
group by 1
order by 2 desc
limit 5;

# Q.9 For each album, calculate the total views of all associated tracks.
select
album,
track,
sum(views) 
from spotify
group by 1,2
order by 3 desc;

# Q.10 Retrieve the track names that have been streamed on Spotify more than YouTube.
select * from 
(select
track, 
coalesce(sum(case when most_played_on = 'Youtube' then stream end),0) as stramed_on_youtube,
coalesce(sum(case when most_played_on = 'Spotify' then stream end),0) as stramed_on_spotify
from spotify
group by 1 
) as t1
where 
stramed_on_spotify > stramed_on_youtube
and
stramed_on_youtube <> 0;


/*
--------------------------------------------
Advanced Level
--------------------------------------------
# Find the top 3 most-viewed tracks for each artist using window functions.
# Write a query to find tracks where the liveness score is above the average.
# Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

*/

# Q.11 Find the top 3 most-viewed tracks for each artist using window functions.

WITH ranking_artist AS (
    SELECT
        artist,
        track,
        SUM(views) AS total_views,
        DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM(views) DESC) AS rank_
    FROM spotify
    GROUP BY artist, track
    ORDER BY artist, total_views DESC
)
SELECT *
FROM ranking_artist
WHERE rank_ <= 3;


# Q.12 Write a query to find tracks where the liveness score is above the average.
select
track,
artist,
liveness
from spotify
where liveness > (select avg(liveness) from spotify);


# Q.13 Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
WITH cte
AS 
(SELECT
        album,
        max(energy) as highest_energy,
        min(energy) as lowest_energy
    FROM spotify
    GROUP BY 1
    )
    select
    album,
    highest_energy - lowest_energy as energy_diff
    from cte;











