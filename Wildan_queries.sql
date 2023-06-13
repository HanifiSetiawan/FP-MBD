-- Query to show the most played song for each user
SELECT u.username, s.song_title, COUNT(*) AS play_count
FROM Users u
JOIN History h ON u.user_id = h.user_id
JOIN Songs s ON h.song_id = s.song_id
GROUP BY u.user_id, u.username, s.song_id, s.song_title
HAVING COUNT(*) = (
    SELECT MAX(sub.play_count)
    FROM (
        SELECT u.user_id, s.song_id, COUNT(*) AS play_count
        FROM Users u
        JOIN History h ON u.user_id = h.user_id
        JOIN Songs s ON h.song_id = s.song_id
        GROUP BY u.user_id, s.song_id
    ) AS sub
    WHERE sub.user_id = u.user_id
)
ORDER BY play_count DESC;

--Query to show the total income per month that come from subscription fees
SELECT '$' || SUM(s.price) AS total_income_per_month
FROM Users u
JOIN Subscriptions s ON u.subscription_id = s.subscription_id;

--Query to show the most liked song for each genre
SELECT s.song_genre, MIN(s.song_title) AS song_title, COUNT(l.like_id) AS like_count
FROM Songs s
LEFT JOIN Likes l ON s.song_id = l.song_id
GROUP BY s.song_genre
ORDER BY s.song_genre;

-- Trigger to make each user have a limit of 50 playlists
CREATE OR REPLACE FUNCTION check_playlist_limit()
RETURNS TRIGGER AS $$
DECLARE
    playlist_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO playlist_count
    FROM Playlists
    WHERE creator_id = NEW.creator_id;
    
    IF playlist_count >= 5 THEN
        RAISE EXCEPTION 'Playlist limit exceeded. Maximum allowed: 5';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_playlist_limit
BEFORE INSERT ON Playlists
FOR EACH ROW
EXECUTE FUNCTION check_playlist_limit();

-- Insert to prove the trigger works
INSERT INTO Playlists (playlist_id, playlist_name, description, creator_id)
VALUES
    (16, 'Playlist 1', 'Description 1', 15),
    (17, 'Playlist 2', 'Description 2', 15),
    (18, 'Playlist 3', 'Description 3', 15),
    (19, 'Playlist 4', 'Description 4', 15),
	(20, 'Playlist 5', 'Description 5', 15);
	
INSERT INTO Playlists (playlist_id, playlist_name, description, creator_id)
VALUES
    (21, 'Playlist 6', 'Description 6', 15);

-- Function to show how many songs in each album
CREATE OR REPLACE FUNCTION song_count_in_album(p_album_id INT)
RETURNS INT AS $$
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM Songs
        WHERE album_id = p_album_id
    );
END;
$$ LANGUAGE plpgsql;

SELECT album_title, song_count_in_album(1) AS total_song
FROM albums;

CREATE INDEX idx_album_id ON Albums (album_id);

select * from playlists;