-- Subscriptions table
CREATE TABLE Subscriptions (
  subscription_id INT PRIMARY KEY,
  subscription_name VARCHAR(50),
  price DECIMAL(8, 2),
  duration INT
);

-- Users table
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(50),
  email VARCHAR(100),
  date_of_birth DATE,
  subscription_id INT,
  FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- Artists table
CREATE TABLE Artists (
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(100),
  biography TEXT,
  country VARCHAR(50)
);

-- Albums table
CREATE TABLE Albums (
  album_id INT PRIMARY KEY,
  album_title VARCHAR(100),
  release_date DATE,
  artist_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- Songs table
CREATE TABLE Songs (
  song_id INT PRIMARY KEY,
  song_title VARCHAR(100),
  duration INT,
  artist_id INT,
  album_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
  FOREIGN KEY (album_id) REFERENCES Albums(album_id),
  song_genre VARCHAR(50)
);

-- Playlists table
CREATE TABLE Playlists (
  playlist_id INT PRIMARY KEY,
  playlist_name VARCHAR(100),
  creator_id INT,
  description TEXT,
  FOREIGN KEY (creator_id) REFERENCES Users(user_id)
);

-- Likes table
CREATE TABLE Likes (
  like_id INT PRIMARY KEY,
  user_id INT,
  song_id INT,
  album_id INT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id),
  FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

-- History table
CREATE TABLE History (
  history_id INT PRIMARY KEY,
  user_id INT,
  song_id INT,
  timestamp TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);


-- Recommendations table
CREATE TABLE Recommendations (
  recommendation_id INT PRIMARY KEY,
  user_id INT,
  song_id INT,
  album_id INT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id),
  FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);


INSERT INTO Subscriptions (subscription_id, subscription_name, price, duration)
VALUES
  (1, 'Basic', 9.99, 30),
  (2, 'Premium', 14.99, 30),
  (3, 'Family', 24.99, 30);

INSERT INTO Users (user_id, username, password, email, date_of_birth, subscription_id)
VALUES
  (1, 'Hanifi_Abrar', 'password123', 'Hanifigeming@example.com', '2003-05-15', 1),
  (2, 'Wira_putu', 'abc123', 'wirwir@example.com', '2003-09-22', 1),
  (3, 'wildan_gita', 'wiliking', 'wiliii@example.com', '2003-12-10', 2),
  (4, 'agus_priambodo', 'agus123', 'aguss123@example.com', '1990-04-15', NULL),
  (5, 'haji_roma', 'irama123', 'ILYhajiromairama@example.com', '1981-06-13', 3),
  (6, 'rafi_handoko', 'rafikeren', 'pastdark@example.com', '1984-11-22', 3),
  (7, 'moira_reyna', 'ngilang123', 'selfheal@example.com', '1956-07-09', NULL),
  (8, 'jett_kiriko', 'asian123', 'knifegemink@example.com', '1975-06-04', 1),
  (9, 'silver_wolf', 'bronyakecil', 'hengkker@example.com', '1963-12-18', 1),
  (10, 'raden_shotgun', 'tukangpln', 'bukandewa@example.com', '1981-06-09', 2),
  (11, 'kumalala_waduh', 'waduh123', 'kumalala123@example.com', '1974-11-11', NULL),
  (12, 'walter_white', 'breakbad123', 'waltergoat@example.com', '1990-08-15', 3),
  (13, 'griffin_stewie', 'brian123', 'maguirelove@example.com', '1965-04-04', 2),
  (14, 'rick_morty', 'scientist123', 'dimensioniscool@example.com', '1969-05-14', 1),
  (15, 'michael_jordan', 'jumpman23', 'michael.jordan@example.com', '1963-02-17', NULL);
  
INSERT INTO Artists (artist_id, artist_name, biography, country)
VALUES
  (1, 'Taylor Swift', 'Taylor Swift is an American singer-songwriter.', 'United States'),
  (2, 'Ed Sheeran', 'Ed Sheeran is an English singer-songwriter.', 'United Kingdom'),
  (3, 'Beyoncé', 'Beyoncé is an American singer, songwriter, and actress.', 'United States'),
  (4, 'Adele', 'Adele is an English singer-songwriter.', 'United Kingdom'),
  (5, 'Coldplay', 'Coldplay is a British rock band.', 'United Kingdom'),
  (6, 'Drake', 'Drake is a Canadian rapper, singer, and songwriter.', 'Canada'),
  (7, 'Rihanna', 'Rihanna is a Barbadian singer, actress, and businesswoman.', 'Barbados'),
  (8, 'Bruno Mars', 'Bruno Mars is an American singer, songwriter, and record producer.', 'United States'),
  (9, 'Queen', 'Queen is a British rock band.', 'United Kingdom'),
  (10, 'Jay-Z', 'Jay-Z is an American rapper, songwriter, and entrepreneur.', 'United States'),
  (11, 'Lady Gaga', 'Lady Gaga is an American singer, songwriter, and actress.', 'United States'),
  (12, 'Eminem', 'Eminem is an American rapper, songwriter, and record producer.', 'United States'),
  (13, 'Katy Perry', 'Katy Perry is an American singer, songwriter, and television judge.', 'United States'),
  (14, 'U2', 'U2 is an Irish rock band.', 'Ireland'),
  (15, 'The Weeknd', 'The Weeknd is a Canadian singer, songwriter, and record producer.', 'Canada');
 
 
INSERT INTO Albums (album_id, album_title, release_date, artist_id)
VALUES
  (1, '1989', '2014-10-27', 1),
  (2, '÷', '2017-03-03', 2),
  (3, 'Lemonade', '2016-04-23', 3),
  (4, '21', '2011-01-24', 4),
  (5, 'Parachutes', '2000-07-10', 5),
  (6, 'Take Care', '2011-11-15', 6),
  (7, 'Good Girl Gone Bad', '2007-05-31', 7),
  (8, '24K Magic', '2016-11-18', 8),
  (9, 'A Night at the Opera', '1975-11-21', 9),
  (10, 'The Blueprint', '2001-09-11', 10),
  (11, 'Born This Way', '2011-05-23', 11),
  (12, 'The Marshall Mathers LP', '2000-05-23', 12),
  (13, 'Teenage Dream', '2010-08-24', 13),
  (14, 'The Joshua Tree', '1987-03-09', 14),
  (15, 'After Hours', '2020-03-20', 15);
  
  
INSERT INTO Songs (song_id, song_title, duration, artist_id, album_id, song_genre)
VALUES
  (1, 'Shake It Off', 219, 1, 1, 'Pop'),
  (2, 'Shape of You', 236, 2, 2, 'Pop'),
  (3, 'Formation', 234, 3, 3, 'R&B'),
  (4, 'Rolling in the Deep', 228, 4, 4, 'R&B'),
  (5, 'Yellow', 263, 5, 5, 'Indie'),
  (6, 'Hotline Bling', 267, 6, 6, 'Pop'),
  (7, 'Umbrella', 263, 7, 7, 'R&B'),
  (8, 'Thats What I Like', 206, 8, 8, 'Funk'),
  (9, 'Bohemian Rhapsody', 355, 9, 9, 'Rock'),
  (10, 'Empire State of Mind', 256, 10, 10, 'Rap'),
  (11, 'Bad Romance', 294, 11, 11, 'Pop'),
  (12, 'Lose Yourself', 326, 12, 12, 'Pop'),
  (13, 'Firework', 227, 13, 13, 'Pop'),
  (14, 'With or Without You', 296, 14, 14, 'Rock'),
  (15, 'Blinding Lights', 201, 15, 15, 'R&B');
  
INSERT INTO Playlists (playlist_id, playlist_name, creator_id, description)
VALUES
  (1, 'Favorites', 1, 'A playlist of my favorite songs.'),
  (2, 'Road Trip Mix', 2, 'Upbeat songs for a fun road trip.'),
  (3, 'Chill Vibes', 3, 'Relaxing tunes for a peaceful evening.'),
  (4, 'Workout Mix', 1, 'Energizing tracks for a great workout.'),
  (5, 'Relaxation Station', 2, 'Soothing melodies for relaxation.'),
  (6, 'Throwback Jams', 3, 'Nostalgic songs from the past.'),
  (7, 'Party Hits', 4, 'Upbeat music for a fun party.'),
  (8, 'Acoustic Sessions', 5, 'Stripped-down acoustic performances.'),
  (9, 'Road Trip Anthems', 6, 'Perfect tunes for a road trip.'),
  (10, 'Late Night Vibes', 7, 'Chill and mellow songs for late nights.'),
  (11, 'Rap Royalty', 8, 'The best of rap and hip-hop.'),
  (12, 'Dance Party', 9, 'Get on the dance floor with these beats.'),
  (13, 'Love Ballads', 10, 'Romantic songs for heartfelt moments.'),
  (14, 'Guitar Legends', 11, 'Legendary guitar solos and riffs.'),
  (15, 'R&B Grooves', 12, 'Smooth R&B tracks to set the mood.');
  
  
INSERT INTO Likes (like_id, user_id, song_id, album_id)
VALUES
  (1, 1, 1, NULL),
  (2, 2, NULL, 2),
  (3, 3, 3, NULL),
  (4, 1, 2, NULL),
  (5, 2, NULL, 3),
  (6, 3, 1, NULL),
  (7, 4, 4, NULL),
  (8, 5, 5, NULL),
  (9, 6, NULL, 6),
  (10, 7, 7, NULL),
  (11, 8, 8, NULL),
  (12, 9, 9, NULL),
  (13, 10, NULL, 10),
  (14, 11, 11, NULL),
  (15, 12, NULL, 12);
  
INSERT INTO History (history_id, user_id, song_id, timestamp)
VALUES
  (1, 1, 1, '2023-06-01 10:30:00'),
  (2, 2, 2, '2023-06-02 15:45:00'),
  (3, 1, 3, '2023-06-03 20:15:00'),
  (4, 1, 3, '2023-06-04 18:30:00'),
  (5, 2, 4, '2023-06-05 11:15:00'),
  (6, 3, 5, '2023-06-06 14:45:00'),
  (7, 4, 6, '2023-06-07 09:30:00'),
  (8, 5, 7, '2023-06-08 20:00:00'),
  (9, 6, 8, '2023-06-09 17:30:00'),
  (10, 7, 9, '2023-06-10 10:15:00'),
  (11, 8, 10, '2023-06-11 13:45:00'),
  (12, 9, 11, '2023-06-12 16:30:00'),
  (13, 10, 12, '2023-06-13 09:00:00'),
  (14, 11, 13, '2023-06-14 18:30:00'),
  (15, 12, 14, '2023-06-15 11:45:00');
  

INSERT INTO Recommendations (recommendation_id, user_id, song_id, album_id)
VALUES
  (1, 1, 5, NULL),
  (2, 1, 7, NULL),
  (3, 2, 3, NULL),
  (4, 2, 10, NULL),
  (5, 3, 1, NULL),
  (6, 3, 9, NULL),
  (7, 4, 2, NULL),
  (8, 4, 8, NULL),
  (9, 5, 4, NULL),
  (10, 5, 6, NULL),
  (11, 6, NULL, 1),
  (12, 6, NULL, 15),
  (13, 7, NULL, 12),
  (14, 7, NULL, 14),
  (15, 8, NULL, 13);

  
  

