SELECT COUNT(DISTINCT artist) FROM Spotify;

SELECT COUNT(DISTINCT album) FROM Spotify;

SELECT DISTINCT album_type FROM Spotify;

-- Find tracks with zero duration
SELECT *
FROM Spotify
WHERE duration_min = 0;

-- Delete the tracks
DELETE FROM Spotify
WHERE duration_min = 0;

SELECT * FROM spotify 
WHERE duration_min=0;

SELECT DISTINCT channel 
FROM spotify;

SELECT DISTINCT most_played_on
FROM spotify;

-- data analysis


-- Q1.Retrieve the names of all the track that have more than 1 billion streams.
SELECT *
FROM Spotify
WHERE stream > 1000000000;

-- Q2: List all the albums along with their respective artist.
SELECT DISTINCT album, artist
FROM Spotify
ORDER BY album, artist;

-- Q3:Get the total number of comments for tracks where license is true.
SELECT
    SUM(comments) AS total_comments
FROM Spotify
WHERE licensed = TRUE;

-- Q4: Find all the tracks that belong to the album type 'Single'.
SELECT *
FROM Spotify
WHERE album_type = 'single';

-- Q5: Count the total number of tracks by each artist.
SELECT
    artist,
    COUNT(*) AS total_number_of_songs
FROM Spotify
GROUP BY artist
ORDER BY total_number_of_songs DESC;


-- Q6: Calculate the average danceability of tracks in each album.
SELECT
    album,
    AVG(danceability) AS average_danceability
FROM Spotify
GROUP BY album
ORDER BY average_danceability DESC;

-- Q7: Find the top five tracks with the highest energy values.
SELECT
    track,
    MAX(energy) AS max_energy
FROM Spotify
GROUP BY track
ORDER BY max_energy DESC
LIMIT 5;

-- Q8: List all the tracks along with their total views and total likes where the official video is true.
SELECT
    track,
    SUM(views) AS total_views,
    SUM(likes) AS total_likes
FROM Spotify
WHERE official_video = TRUE
GROUP BY track
ORDER BY 2 desc
LIMIT 5;

-- Q9: For each album, calculate the total views of all associated tracks.
SELECT
    album,
    track,
    SUM(views) AS total_views
FROM Spotify
GROUP BY 1, 2
ORDER BY total_views DESC;

-- Q10: Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT 
    track,
    streamed_on_youtube,
    streamed_on_spotify
FROM (
    SELECT 
        track,
        SUM(CASE WHEN most_played_on = 'Youtube' THEN stream ELSE 0 END) AS streamed_on_youtube,
        SUM(CASE WHEN most_played_on = 'Spotify' THEN stream ELSE 0 END) AS streamed_on_spotify
    FROM spotify
    GROUP BY track
) AS T1
WHERE streamed_on_youtube < streamed_on_spotify
  AND streamed_on_youtube <> 0;

-- Q11: Find the top three most viewed tracks for each artist using a window function.
WITH ranking_artist AS (
    SELECT
        artist,
        track,
        SUM(views) AS total_view,
        DENSE_RANK() OVER (
            PARTITION BY artist
            ORDER BY SUM(views) DESC
        ) AS rank
    FROM Spotify
    GROUP BY artist, track
)
SELECT *
FROM ranking_artist
WHERE rank <= 3;

-- Q12:Find the tracks where the liveness score is above the average.
SELECT
    track,
    artist,
    liveness
FROM Spotify
WHERE liveness > (
    SELECT AVG(liveness)
    FROM Spotify
);

-- Q13:Calculate the difference between the highest and lowest energy value for tracks in each album.
Explain analyze
WITH CTE AS (
    SELECT
        album,
        MAX(energy) AS highest_energy,
        MIN(energy) AS lowest_energy
    FROM Spotify
    GROUP BY album
)
SELECT
    album,
    (highest_energy - lowest_energy) AS energy_difference
FROM CTE
ORDER BY energy_difference DESC;

Explain Analyze
-- before index
-- "Planning Time: 0.106 ms"
-- "Execution Time: 2.854 ms"

-- after index
-- "Planning Time: 0.097 ms"
-- "Execution Time: 0.076 ms"
SELECT 
	artist,
	track ,
	views
FROM spotify
WHERE artist='Gorillaz'
	AND 
	most_played_on='Youtube'
ORDER BY stream DESC limit 25;

CREATE INDEX artist_index ON spotify(artist)

