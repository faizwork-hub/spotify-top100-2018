ALTER TABLE spotify_data
RENAME COLUMN name TO song_name;

ALTER TABLE spotify_data
RENAME COLUMN `duration_ms_[0]` TO duration_min;

SELECT *
FROM spotify_data;

-- Which artists had the most Top 100 songs?
SELECT artists, COUNT(artists) AS number_of_songs
FROM spotify_data
GROUP BY artists
ORDER BY number_of_songs DESC
LIMIT 3;

-- Are there more artists in the Top 100 with 'Lil' in their name, or with 'DJ' in their name?
SELECT song_name, artists
FROM spotify_data
WHERE artists LIKE 'Lil%' OR artists LIKE 'DJ%';

-- Display all columns and rows from the spotify_data table.
SELECT *
FROM spotify_data;

-- List only the name and artists of all songs.
SELECT song_name, artists
FROM spotify_data;

-- Count the total number of songs in the table.
SELECT COUNT(song_name) AS number_of_songs
FROM spotify_data;

-- Find the song with the highest tempo.
SELECT song_name, artists, tempo
FROM spotify_data
ORDER BY tempo DESC
LIMIT 3;

-- Find the song with the highest loudness (most positive dB value).
SELECT song_name, artists, loudness
FROM spotify_data
ORDER BY loudness DESC
LIMIT 3;

-- List all songs where the energy value is greater than 0.5.
SELECT song_name, artists, energy
FROM spotify_data
WHERE energy > 0.5
ORDER BY energy;

-- Calculate the average tempo of all songs.
SELECT ROUND(AVG(tempo),3) AS avg_tempo_songs
FROM spotify_data;

-- List all songs with a duration shorter than 3 minutes.
SELECT song_name, artists, duration_min
FROM spotify_data
WHERE duration_min < 3
ORDER BY duration_min DESC;

-- Find the song with the highest danceability score.
SELECT song_name, artists, danceability
FROM spotify_data
ORDER BY danceability DESC
LIMIT 3;

-- Count how many songs have a speechiness value greater than 0.1.
SELECT COUNT(speechiness) AS song_speechiness
FROM spotify_data
WHERE speechiness > 0.1;

-------------------

-- Find the average energy for each artist in the dataset. Sort the results in descending order of energy.
SELECT artists, ROUND(AVG(energy),3) AS avg_energy_artists
FROM spotify_data
GROUP BY artists
ORDER BY avg_energy_artists DESC;

-- Find the song(s) with the highest loudness and return the name, artists, and loudness.
SELECT song_name, artists, loudness
FROM spotify_data
ORDER BY loudness DESC
LIMIT 3;

-- List all artists who have at least 2 songs in the dataset.
SELECT artists
FROM spotify_data
GROUP BY artists
HAVING COUNT(song_name) >= 2;

-- Find the song with the longest duration (in minutes), and return the name, artists, and duration_ms.
SELECT song_name, artists, duration_min
FROM spotify_data
ORDER BY duration_min DESC
LIMIT 1;

-- Calculate the total duration of all songs in the dataset (in minutes).
SELECT ROUND(SUM(duration_min),3) AS total_duration_all_songs
FROM spotify_data;

-- For each artist, calculate the average danceability and tempo, and filter only artists with an average danceability greater than 0.7.
SELECT
	artists,
    ROUND(AVG(danceability),3) AS avg_danceability, 
    ROUND(AVG(tempo),3) AS avg_tempo
FROM
	spotify_data
GROUP BY
	artists
HAVING
	avg_danceability > 0.7;

-- List the top 3 songs with the highest tempo in the dataset, and return the name, artists, and tempo.
SELECT song_name, artists, tempo
FROM spotify_data
ORDER BY tempo DESC
LIMIT 3;

-- For each artist, find the song with the highest energy and return the artists, name, and energy of that song.
SELECT artists, song_name, energy
FROM spotify_data
GROUP BY artists, song_name, energy
ORDER BY energy DESC;



