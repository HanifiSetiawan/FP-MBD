# FP-MBD

| Name | NRP |
| --------------- | --------------- |
| Hanifi Abrar Setiawan | 5025211066 |
| | |

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
