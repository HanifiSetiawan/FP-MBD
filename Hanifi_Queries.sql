--Query to retrieve the names of users along with the total number of songs they have liked:

SELECT u.username, COUNT(l.song_id) AS total_likes
FROM Users u
LEFT JOIN Likes l ON u.user_id = l.user_id
GROUP BY u.username;


-- Query to retrieve the details of songs liked by a specific user along with the corresponding artist and album information:
SELECT s.song_title, a.artist_name, al.album_title
FROM Songs s
JOIN Likes l ON s.song_id = l.song_id
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Albums al ON s.album_id = al.album_id
WHERE l.user_id = 5;


-- Query to retrieve the top 5 recommended songs along with the corresponding artist and album information:
SELECT s.song_title, a.artist_name, al.album_title
FROM Songs s
JOIN Recommendations r ON s.song_id = r.song_id
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Albums al ON s.album_id = al.album_id
GROUP BY s.song_id, s.song_title, a.artist_name, al.album_title
ORDER BY COUNT(r.recommendation_id) DESC
LIMIT 5;

SELECT p.playlist_name, COUNT(ps.song_id) AS total_songs
FROM Playlists p
JOIN PlaylistSongs ps ON p.playlist_id = ps.playlist_id
WHERE p.creator_id = 14
GROUP BY p.playlist_name;

--Query to retrieve the details of songs liked by a specific user along with the corresponding artist and album information, filtered by a specific genre:
SELECT s.song_title, a.artist_name, al.album_title
FROM Songs s
JOIN Likes l ON s.song_id = l.song_id
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Albums al ON s.album_id = al.album_id
WHERE l.user_id = 1
  AND s.song_genre = 'Pop';
 
--Trigger to enforce a maximum duration for songs added to an album:
CREATE OR REPLACE FUNCTION check_song_duration()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.duration > 300 THEN
        RAISE EXCEPTION 'Maximum song duration exceeded';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_song_duration_trigger
BEFORE INSERT OR UPDATE ON Songs
FOR EACH ROW
EXECUTE FUNCTION check_song_duration();

SELECT *
FROM information_schema.triggers
WHERE trigger_name = 'check_song_duration_trigger';



--Function to get the total number of songs liked by a user
CREATE OR REPLACE FUNCTION get_total_likes(p_user_id INT)
RETURNS INT AS $$
DECLARE
    total_likes INT;
BEGIN
    SELECT COUNT(*) INTO total_likes
    FROM Likes
    WHERE user_id = p_user_id;

    RETURN total_likes;
END;
$$ LANGUAGE plpgsql;

SELECT user_id, get_total_likes(user_id) AS total_likes
FROM Users
WHERE Users.user_id = 1;

--This creates a multi-column index on the Likes table, involving the user_id, song_id, and album_id columns. It can enhance the performance of queries that involve filtering or sorting based on these columns collectively
CREATE INDEX idx_user_likes ON Likes (user_id, song_id, album_id);


show data_directory;