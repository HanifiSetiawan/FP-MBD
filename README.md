# Music Streaming Service Management

| Name | NRP |
| --------------- | --------------- |
| Hanifi Abrar Setiawan | 5025211066 |
| | |

## Database
The Database consist of 9 table:

## Queries
### Hanifi :
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
