# Music Streaming Service Management

| Name | NRP |
| --------------- | --------------- |
| Hanifi Abrar Setiawan | 5025211066 |
| | |

## Database
The Database consist of 9 table:
1. Subscriptions
   - subscription_id (primary key)
   - subscription_name
   - price (in dollars)
   - duration (in days)
2. Users
   - user_id (primary key)
   - username
   - password
   - email
   - date_of_birth
   - subscription_id (foreign key referencing the Subscriptions table)
3. Artists
   - artist_id (primary key)
   - artist_name
   - brief biography
   - country
4. Albums
   - album_id (primary key)
   - album_title
   - release_date
   - artist_id (foreign key referencing the artists table)
5. Songs
   - song_id (primary key)
   - song_title
   - song_genre
   - duration (in seconds)
   - artist_id (foreign key referencing the artists table)
   - album_id (foreign key referencing the albums table)
6. Playlists
   - playlist_id (primary key)
   - playlist_name
   - brief description
   - creator_id (foreign key referencing the users table)
7. Likes
   - like_id (primary key)
   - user_id (foreign key referencing the users table)
   - song_id (foreign key referencing the songs table)
   - album_id (foreign key referencing the albums table)
8. History
   - history_id (primary key)
   - Timestamp
   - user_id (foreign key referencing the users table)
   - song_id (foreign key referencing the songs table)
9. Recommendations
   - recommendation_id (primary key)
   - user_id (foreign key referencing the users table)
   - song_id (foreign key referencing the songs table)
   - album_id (foreign key referencing the albums table)
## Queries
### Hanifi 
---
1. Query to retrieve the names of users along with the total number of songs they have liked
```sql
SELECT u.username, COUNT(l.song_id) AS total_likes
FROM Users u
LEFT JOIN Likes l ON u.user_id = l.user_id
GROUP BY u.username;
```
---
2. Query to retrieve the top 5 recommended songs along with the corresponding artist and album information
```sql
SELECT s.song_title, a.artist_name, al.album_title
FROM Songs s
JOIN Recommendations r ON s.song_id = r.song_id
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Albums al ON s.album_id = al.album_id
GROUP BY s.song_id, s.song_title, a.artist_name, al.album_title
ORDER BY COUNT(r.recommendation_id) DESC
LIMIT 5;
```
---
3. Query to retrieve the details of songs liked by a specific user along with the corresponding artist and album information, filtered by a specific genre
```sql
SELECT s.song_title, a.artist_name, al.album_title
FROM Songs s
JOIN Likes l ON s.song_id = l.song_id
JOIN Artists a ON s.artist_id = a.artist_id
JOIN Albums al ON s.album_id = al.album_id
WHERE l.user_id = 1
  AND s.song_genre = 'Pop';
```
## Triggers
### Hanifi
Trigger to enforce a maximum duration for songs added to an album
```sql
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
```
#### Explanation

