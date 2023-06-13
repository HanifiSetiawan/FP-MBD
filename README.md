# Music Streaming Service Management

| Name | NRP |
| --------------- | --------------- |
| Hanifi Abrar Setiawan | 5025211066 |
| Vija Wildan Gita Prabawa | 5025211261 |
| I Putu Arya Prawira Wiwekananda | 5025211065 |

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
---
## Tables and Relation
- The service will have several type of subscription
   - Each subscription plan will have different price and duration
   - User can choose whether to continue their subscription or not
- All users and artists may have their own playlist
   - Inside the playlist, there will be playlist name, id and song
- Service will save user’s history of their played song
- Each song will have their own artist and album
   - Album will have at least 1 song inside and it will have their own artist
- Users can recommend a song to any user they’d like to share with

---
## CDM
![image](https://github.com/HanifiSetiawan/FP-MBD/assets/115712593/93427edd-f4f6-4c29-8016-ecc3adb915e0)

## PDM
![image](https://github.com/HanifiSetiawan/FP-MBD/assets/115712593/1cb1c703-9ea8-4a28-83f5-0309bc5bce7a)

## Queries
### Hanifi 
1. Query to retrieve the names of users along with the total number of songs they have liked
```sql
SELECT u.username, COUNT(l.song_id) AS total_likes
FROM Users u
LEFT JOIN Likes l ON u.user_id = l.user_id
GROUP BY u.username;
```
#### Output:
![image](https://github.com/HanifiSetiawan/FP-MBD/assets/115058216/710ece08-e5eb-4676-accd-d213fc962bd0)


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
#### Output:
![image](https://github.com/HanifiSetiawan/FP-MBD/assets/115058216/7f1ed6b8-6c5b-46eb-b92d-ddefec913c6a)


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
#### Output:
![image](https://github.com/HanifiSetiawan/FP-MBD/assets/115058216/abad9c8b-a5ab-4cc3-86d9-8ad52cc7bea2)
---

### Wildan
1. Query to show the most played song for each user
```sql
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
```
2. Query to show the total income per month that come from subscription fees
```sql
SELECT '$' || SUM(s.price) AS total_income_per_month
FROM Users u
JOIN Subscriptions s ON u.subscription_id = s.subscription_id;
```
3. Query to show the most liked song for each genre
```sql
SELECT s.song_genre, MIN(s.song_title) AS song_title, COUNT(l.like_id) AS like_count
FROM Songs s
LEFT JOIN Likes l ON s.song_id = l.song_id
GROUP BY s.song_genre
ORDER BY s.song_genre;
```

### Wira
1. Query to show the songs from each artists
```sql
SELECT a.artist_name, s.song_genre
FROM Artists a
JOIN Songs s ON a.artist_id = s.artist_id;
```
2. Query to show the genre of each artists and the total likes that they have
```sql
SELECT a.artist_name, s.song_genre, COUNT(l.like_id) AS total_likes
FROM Artists a
JOIN Songs s ON a.artist_id = s.artist_id
LEFT JOIN Likes l ON s.song_id = l.song_id
GROUP BY a.artist_name, s.song_genre;
```
3. Query to show the latest songs that they played from each user
```sql
SELECT u.username, s.song_title AS latest_song
FROM Users u
LEFT JOIN History h ON u.user_id = h.user_id
LEFT JOIN Songs s ON h.song_id = s.song_id
WHERE h.Timestamp = (
  SELECT MAX(Timestamp)
  FROM History
  WHERE user_id = u.user_id
)
```

---
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
1. The function is defined with the RETURNS TRIGGER clause, indicating that it is a trigger function that operates on a row-level and returns a trigger record.
2. Inside the function body, there is a conditional statement:
   ```sql
   IF NEW.duration > 300 THEN
    RAISE EXCEPTION 'Maximum song duration exceeded';
   END IF;
   ```
   This checks if the duration value of the new row being inserted or updated (NEW.duration) exceeds the maximum allowed duration of 300. If it does, an exception is raised with the message "Maximum song duration       
   exceeded".
3. The function then returns the NEW trigger record. This is required for BEFORE triggers to allow the operation to proceed if the function does not raise an exception. If an exception is raised, the trigger action 
   (insert or update) will be canceled.
4. The trigger is created using the CREATE TRIGGER statement:
   ```sql
   CREATE TRIGGER check_song_duration_trigger
   BEFORE INSERT OR UPDATE ON Songs
   FOR EACH ROW
   EXECUTE FUNCTION check_song_duration();
   ```
   The trigger is associated with the Songs table and is triggered before each row is inserted or updated. It calls the check_song_duration() function to perform the validation.
5. Finally, a query is executed to check the existence of the trigger in the "information_schema.triggers" view:
   ```sql
   SELECT *
   FROM information_schema.triggers
   WHERE trigger_name = 'check_song_duration_trigger';
   ```
   
### Wildan
Trigger to make each user have a limit of 50 playlists
```sql
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
```

### Explanation
1. First, we create a function called `check_playlist_limit()` that used RETURNS TRIGGER clause.
```sql
CREATE OR REPLACE FUNCTION check_playlist_limit()
RETURNS TRIGGER AS $$
```
2. Inside the function we will declare the `playlist_count` as integer.
```sql
DECLARE
    playlist_count INTEGER;
```
3. After declaring, we will begin the function with counting the playlist for each `creator_id`
```sql
BEGIN
    SELECT COUNT(*) INTO playlist_count
    FROM Playlists
    WHERE creator_id = NEW.creator_id;
```
4. If a creator reached 5 playlist and try to add a new one, it will print and exception that the user can't make another playlist.
```sql
IF playlist_count >= 5 THEN
        RAISE EXCEPTION 'Playlist limit exceeded. Maximum allowed: 5';
    END IF;
```
5. After we run the function, we will execute the trigger as the following:
```sql
CREATE OR REPLACE TRIGGER enforce_playlist_limit
BEFORE INSERT ON Playlists
FOR EACH ROW
EXECUTE FUNCTION check_playlist_limit();
```
6. To check if the trigger works, we will run the following insert command
```sql
INSERT INTO Playlists (playlist_id, playlist_name, description, creator_id)
VALUES
    (16, 'Playlist 1', 'Description 1', 15),
    (17, 'Playlist 2', 'Description 2', 15),
    (18, 'Playlist 3', 'Description 3', 15),
    (19, 'Playlist 4', 'Description 4', 15),
	(20, 'Playlist 5', 'Description 5', 15);
```
This part will insert 5 new playlist for `creator_id` 15 who haven't made any playlist yet. After that we will run the following:
```sql
INSERT INTO Playlists (playlist_id, playlist_name, description, creator_id)
VALUES
    (21, 'Playlist 6', 'Description 6', 15);
```
If the trigger works, it will print an error message:
```
ERROR:  Playlist limit exceeded. Maximum allowed: 5
CONTEXT:  PL/pgSQL function check_playlist_limit() line 10 at RAISE 

SQL state: P0001
```

---
## Function And Procedures
### Hanifi
Function to get the total number of songs liked by a user
```sql
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
```
#### Explanation
1. Inside the function body, a variable total_likes of type integer is declared:
   ```sql
   DECLARE
   total_likes INT;
   ```
   This variable will hold the total number of likes for the user.
2. The function performs a SQL query to count the number of likes for the specified user:
   ```sql
   SELECT COUNT(*) INTO total_likes
   FROM Likes
   WHERE user_id = p_user_id;
   ```
   The SELECT COUNT(*) statement retrieves the count of rows from the Likes table where the user_id matches the p_user_id parameter. The result is stored in the total_likes variable using the INTO clause.
3. Finally, the function returns the total_likes value:
   ```sql
   RETURN total_likes;
   ```
4. This function can be used in a query to retrieve the user ID and their total number of likes:
   ```sql
   SELECT user_id, get_total_likes(user_id) AS total_likes
   FROM Users
   WHERE Users.user_id = 1;
   ```
   In this example, the function is called within the SELECT statement to calculate the total likes for a specific user with user_id equal to 1. The result is returned as a column named total_likes alongside the user ID.
### Wildan
Function to show how many songs in each album
```sql
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
```
### Explanation
1. First we make a function with RETURN INTEGER cluase
```sql
CREATE OR REPLACE FUNCTION song_count_in_album(p_album_id INT)
RETURNS INT AS $$
```
2. After that, we will begin the function. Inside this function, we will have to use COUNT to count all the songs inside every album in the database.
```sql
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM Songs
        WHERE album_id = p_album_id
    );
```
3. If we finished the function, we can check the it with the following command:
```sql
SELECT album_title, song_count_in_album(1) AS total_song
FROM albums;
```
It will show the album_title that available in the database and the amount of song inside each album

---
## Indexing
### Hanifi
This index creates a multi-column index on the Likes table, involving the user_id, song_id, and album_id columns. It can enhance the performance of queries that involve filtering or sorting based on these columns collectively
```sql
CREATE INDEX idx_user_likes ON Likes (user_id, song_id, album_id);
```
### Wildan
The index will create an index of the album_id. It can improve the performance of queries which allows for faster data retrieval.
```sql
CREATE INDEX idx_album_id ON Albums (album_id);
```
### Wira
This index will speed up queries that involve searching or sorting based on the artist_name column in the Artists table.
```sql
CREATE INDEX idx_artists_artistname ON Artists (artist_name);
```

---
