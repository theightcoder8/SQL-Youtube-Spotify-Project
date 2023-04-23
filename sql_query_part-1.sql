-- Which songs have the highest danceability score?
/*
SELECT Danceability
FROM SQL_youtube_spotify_project..spotify_data
WHERE Danceability > 0.95
*/


-- What is the average loudness of songs by a particular artist?
/*
SELECT AVG(Loudness) as avg_loudness
FROM SQL_youtube_spotify_project..spotify_data
WHERE Artist = 'Halsey'
*/


-- Which top 10 album has the highest average energy score?
/*
SELECT TOP 10 AVG(Energy) AS energy_score, Album
FROM SQL_youtube_spotify_project..spotify_data
GROUP BY Album
ORDER BY energy_score DESC
*/


-- Which tracks have the highest speechiness scores?
/*
SELECT TOP 25 Speechiness
FROM SQL_youtube_spotify_project..spotify_data
ORDER BY Speechiness DESC
*/


-- How many tracks have a tempo greater than a 205.50?
/*
SELECT COUNT(Tempo) Tempo
FROM SQL_youtube_spotify_project..spotify_data
WHERE Tempo > 205.50
*/


-- Which tracks have a duration greater than 4500000ms?
/*
SELECT Duration_ms
FROM SQL_youtube_spotify_project..spotify_data
WHERE Duration_ms > 4500000
*/


-- Which tracks have both a high danceability score and a high valence score?
/*
SELECT Danceability, Valence
FROM SQL_youtube_spotify_project..spotify_data
WHERE Danceability > 0.94 AND Valence > 0.93
ORDER BY Danceability DESC, Valence DESC
*/


-- How many licensed music videos are there in the YouTube data?
/*
SELECT COUNT(Licensed) as licensed_youtube_videos
FROM SQL_youtube_spotify_project..youtube_data
WHERE Licensed = 1
*/


-- Which artists have the most views on YouTube?
/*
SELECT Artist, SUM(Views) AS total_views
FROM SQL_youtube_spotify_project..youtube_data
GROUP BY Artist
ORDER BY total_views DESC
*/


-- How many comments have been left on YouTube videos by a particular artist?
/*
SELECT Artist, SUM(Comments) AS total_comments
FROM SQL_youtube_spotify_project..youtube_data
GROUP BY Artist
ORDER BY total_comments DESC
*/


-- Which songs from Spotify have the most views on YouTube?
/*
SELECT TOP 10 sd.Track, yd.Artist, yd.Views
FROM SQL_youtube_spotify_project..spotify_data sd
INNER JOIN SQL_youtube_spotify_project..youtube_data yd ON sd.Artist = yd.Artist
ORDER BY yd.Views DESC
*/


-- How many tracks from Spotify are also available as licensed music videos on YouTube
/*
SELECT COUNT(yd.Licensed) as licensed_videos
FROM SQL_youtube_spotify_project..spotify_data sd
INNER JOIN SQL_youtube_spotify_project..youtube_data yd ON sd.Artist = yd.Artist
*/


-- Which artists have the highest average danceability score across both Spotify and YouTube?
/*
SELECT TOP 10 AVG(sd.Danceability) AS avg_danceability, sd.Artist
FROM SQL_youtube_spotify_project..spotify_data sd
INNER JOIN SQL_youtube_spotify_project..youtube_data yd ON sd.Artist = yd.Artist
GROUP BY sd.Artist
ORDER BY avg_danceability DESC
*/


-- Which songs on Spotify have official music videos on YouTube with more than a certain number of likes?
SELECT sd.Artist, sd.Track, yd.Likes
FROM SQL_youtube_spotify_project..spotify_data sd
INNER JOIN SQL_youtube_spotify_project..youtube_data yd ON sd.Artist = yd.Artist
