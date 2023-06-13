toc.dat                                                                                             0000600 0004000 0002000 00000032604 14441305425 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       !    3                {            Music Streaming Service    15.2    15.2 ,    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         ?           1262    49529    Music Streaming Service    DATABASE        CREATE DATABASE "Music Streaming Service" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 )   DROP DATABASE "Music Streaming Service";
                postgres    false         Ψ            1259    49616    albums    TABLE        CREATE TABLE public.albums (
    album_id integer NOT NULL,
    album_title character varying(100),
    release_date date,
    artist_id integer
);
    DROP TABLE public.albums;
       public         heap    postgres    false         Χ            1259    49609    artists    TABLE        CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    artist_name character varying(100),
    biography text,
    country character varying(50)
);
    DROP TABLE public.artists;
       public         heap    postgres    false         ά            1259    49678    history    TABLE        CREATE TABLE public.history (
    history_id integer NOT NULL,
    user_id integer,
    song_id integer,
    "timestamp" timestamp without time zone
);
    DROP TABLE public.history;
       public         heap    postgres    false         Ϋ            1259    49658    likes    TABLE     |   CREATE TABLE public.likes (
    like_id integer NOT NULL,
    user_id integer,
    song_id integer,
    album_id integer
);
    DROP TABLE public.likes;
       public         heap    postgres    false         Ϊ            1259    49641 	   playlists    TABLE        CREATE TABLE public.playlists (
    playlist_id integer NOT NULL,
    playlist_name character varying(100),
    creator_id integer,
    description text
);
    DROP TABLE public.playlists;
       public         heap    postgres    false         ή            1259    49698    recommendations    TABLE        CREATE TABLE public.recommendations (
    recommendation_id integer NOT NULL,
    user_id integer,
    song_id integer,
    album_id integer
);
 #   DROP TABLE public.recommendations;
       public         heap    postgres    false         Ω            1259    49626    songs    TABLE     Μ   CREATE TABLE public.songs (
    song_id integer NOT NULL,
    song_title character varying(100),
    duration integer,
    artist_id integer,
    album_id integer,
    song_genre character varying(50)
);
    DROP TABLE public.songs;
       public         heap    postgres    false         έ            1259    49693    subscriptions    TABLE     §   CREATE TABLE public.subscriptions (
    subscription_id integer NOT NULL,
    subscription_name character varying(50),
    price numeric(8,2),
    duration integer
);
 !   DROP TABLE public.subscriptions;
       public         heap    postgres    false         Φ            1259    49604    users    TABLE     Ϋ   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50),
    password character varying(50),
    email character varying(100),
    date_of_birth date,
    subscription_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false         3          0    49616    albums 
   TABLE DATA           P   COPY public.albums (album_id, album_title, release_date, artist_id) FROM stdin;
    public          postgres    false    216       3379.dat 2          0    49609    artists 
   TABLE DATA           M   COPY public.artists (artist_id, artist_name, biography, country) FROM stdin;
    public          postgres    false    215       3378.dat 7          0    49678    history 
   TABLE DATA           L   COPY public.history (history_id, user_id, song_id, "timestamp") FROM stdin;
    public          postgres    false    220       3383.dat 6          0    49658    likes 
   TABLE DATA           D   COPY public.likes (like_id, user_id, song_id, album_id) FROM stdin;
    public          postgres    false    219       3382.dat 5          0    49641 	   playlists 
   TABLE DATA           X   COPY public.playlists (playlist_id, playlist_name, creator_id, description) FROM stdin;
    public          postgres    false    218       3381.dat 9          0    49698    recommendations 
   TABLE DATA           X   COPY public.recommendations (recommendation_id, user_id, song_id, album_id) FROM stdin;
    public          postgres    false    222       3385.dat 4          0    49626    songs 
   TABLE DATA           _   COPY public.songs (song_id, song_title, duration, artist_id, album_id, song_genre) FROM stdin;
    public          postgres    false    217       3380.dat 8          0    49693    subscriptions 
   TABLE DATA           \   COPY public.subscriptions (subscription_id, subscription_name, price, duration) FROM stdin;
    public          postgres    false    221       3384.dat 1          0    49604    users 
   TABLE DATA           c   COPY public.users (user_id, username, password, email, date_of_birth, subscription_id) FROM stdin;
    public          postgres    false    214       3377.dat            2606    49620    albums albums_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);
 <   ALTER TABLE ONLY public.albums DROP CONSTRAINT albums_pkey;
       public            postgres    false    216                    2606    49615    artists artists_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);
 >   ALTER TABLE ONLY public.artists DROP CONSTRAINT artists_pkey;
       public            postgres    false    215                    2606    49682    history history_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
       public            postgres    false    220                    2606    49662    likes likes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (like_id);
 :   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
       public            postgres    false    219                    2606    49647    playlists playlists_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (playlist_id);
 B   ALTER TABLE ONLY public.playlists DROP CONSTRAINT playlists_pkey;
       public            postgres    false    218                    2606    49702 $   recommendations recommendations_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (recommendation_id);
 N   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_pkey;
       public            postgres    false    222                    2606    49630    songs songs_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);
 :   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_pkey;
       public            postgres    false    217                    2606    49697     subscriptions subscriptions_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (subscription_id);
 J   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_pkey;
       public            postgres    false    221                    2606    49608    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    214                    2606    49621    albums albums_artist_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);
 F   ALTER TABLE ONLY public.albums DROP CONSTRAINT albums_artist_id_fkey;
       public          postgres    false    215    3207    216                    2606    49688    history history_song_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);
 F   ALTER TABLE ONLY public.history DROP CONSTRAINT history_song_id_fkey;
       public          postgres    false    217    220    3211                    2606    49683    history history_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.history DROP CONSTRAINT history_user_id_fkey;
       public          postgres    false    220    214    3205                    2606    49673    likes likes_album_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);
 C   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_album_id_fkey;
       public          postgres    false    216    3209    219                    2606    49668    likes likes_song_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_song_id_fkey;
       public          postgres    false    217    3211    219                    2606    49663    likes likes_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_fkey;
       public          postgres    false    214    219    3205                    2606    49648 #   playlists playlists_creator_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(user_id);
 M   ALTER TABLE ONLY public.playlists DROP CONSTRAINT playlists_creator_id_fkey;
       public          postgres    false    214    3205    218                     2606    49713 -   recommendations recommendations_album_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);
 W   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_album_id_fkey;
       public          postgres    false    216    222    3209         ‘           2606    49708 ,   recommendations recommendations_song_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);
 V   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_song_id_fkey;
       public          postgres    false    217    3211    222         ’           2606    49703 ,   recommendations recommendations_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 V   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_user_id_fkey;
       public          postgres    false    3205    214    222                    2606    49636    songs songs_album_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);
 C   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_album_id_fkey;
       public          postgres    false    3209    217    216                    2606    49631    songs songs_artist_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);
 D   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_artist_id_fkey;
       public          postgres    false    217    3207    215                    2606    49718     users users_subscription_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(subscription_id);
 J   ALTER TABLE ONLY public.users DROP CONSTRAINT users_subscription_id_fkey;
       public          postgres    false    214    3219    221                                                                                                                                    3379.dat                                                                                            0000600 0004000 0002000 00000000653 14441305425 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1989	2014-10-27	1
2	Γ·	2017-03-03	2
3	Lemonade	2016-04-23	3
4	21	2011-01-24	4
5	Parachutes	2000-07-10	5
6	Take Care	2011-11-15	6
7	Good Girl Gone Bad	2007-05-31	7
8	24K Magic	2016-11-18	8
9	A Night at the Opera	1975-11-21	9
10	The Blueprint	2001-09-11	10
11	Born This Way	2011-05-23	11
12	The Marshall Mathers LP	2000-05-23	12
13	Teenage Dream	2010-08-24	13
14	The Joshua Tree	1987-03-09	14
15	After Hours	2020-03-20	15
\.


                                                                                     3378.dat                                                                                            0000600 0004000 0002000 00000002145 14441305425 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Taylor Swift	Taylor Swift is an American singer-songwriter.	United States
2	Ed Sheeran	Ed Sheeran is an English singer-songwriter.	United Kingdom
3	BeyoncΓ©	BeyoncΓ© is an American singer, songwriter, and actress.	United States
4	Adele	Adele is an English singer-songwriter.	United Kingdom
5	Coldplay	Coldplay is a British rock band.	United Kingdom
6	Drake	Drake is a Canadian rapper, singer, and songwriter.	Canada
7	Rihanna	Rihanna is a Barbadian singer, actress, and businesswoman.	Barbados
8	Bruno Mars	Bruno Mars is an American singer, songwriter, and record producer.	United States
9	Queen	Queen is a British rock band.	United Kingdom
10	Jay-Z	Jay-Z is an American rapper, songwriter, and entrepreneur.	United States
11	Lady Gaga	Lady Gaga is an American singer, songwriter, and actress.	United States
12	Eminem	Eminem is an American rapper, songwriter, and record producer.	United States
13	Katy Perry	Katy Perry is an American singer, songwriter, and television judge.	United States
14	U2	U2 is an Irish rock band.	Ireland
15	The Weeknd	The Weeknd is a Canadian singer, songwriter, and record producer.	Canada
\.


                                                                                                                                                                                                                                                                                                                                                                                                                           3383.dat                                                                                            0000600 0004000 0002000 00000000631 14441305425 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	2023-06-01 10:30:00
2	2	2	2023-06-02 15:45:00
3	1	3	2023-06-03 20:15:00
4	1	3	2023-06-04 18:30:00
5	2	4	2023-06-05 11:15:00
6	3	5	2023-06-06 14:45:00
7	4	6	2023-06-07 09:30:00
8	5	7	2023-06-08 20:00:00
9	6	8	2023-06-09 17:30:00
10	7	9	2023-06-10 10:15:00
11	8	10	2023-06-11 13:45:00
12	9	11	2023-06-12 16:30:00
13	10	12	2023-06-13 09:00:00
14	11	13	2023-06-14 18:30:00
15	12	14	2023-06-15 11:45:00
\.


                                                                                                       3382.dat                                                                                            0000600 0004000 0002000 00000000230 14441305425 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	\N
2	2	\N	2
3	3	3	\N
4	1	2	\N
5	2	\N	3
6	3	1	\N
7	4	4	\N
8	5	5	\N
9	6	\N	6
10	7	7	\N
11	8	8	\N
12	9	9	\N
13	10	\N	10
14	11	11	\N
15	12	\N	12
\.


                                                                                                                                                                                                                                                                                                                                                                        3381.dat                                                                                            0000600 0004000 0002000 00000001451 14441305425 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Favorites	1	A playlist of my favorite songs.
2	Road Trip Mix	2	Upbeat songs for a fun road trip.
3	Chill Vibes	3	Relaxing tunes for a peaceful evening.
4	Workout Mix	1	Energizing tracks for a great workout.
5	Relaxation Station	2	Soothing melodies for relaxation.
6	Throwback Jams	3	Nostalgic songs from the past.
7	Party Hits	4	Upbeat music for a fun party.
8	Acoustic Sessions	5	Stripped-down acoustic performances.
9	Road Trip Anthems	6	Perfect tunes for a road trip.
10	Late Night Vibes	7	Chill and mellow songs for late nights.
11	Rap Royalty	8	The best of rap and hip-hop.
12	Dance Party	9	Get on the dance floor with these beats.
13	Love Ballads	10	Romantic songs for heartfelt moments.
14	Guitar Legends	11	Legendary guitar solos and riffs.
15	R&B Grooves	12	Smooth R&B tracks to set the mood.
\.


                                                                                                                                                                                                                       3385.dat                                                                                            0000600 0004000 0002000 00000000227 14441305425 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	5	\N
2	1	7	\N
3	2	3	\N
4	2	10	\N
5	3	1	\N
6	3	9	\N
7	4	2	\N
8	4	8	\N
9	5	4	\N
10	5	6	\N
11	6	\N	1
12	6	\N	15
13	7	\N	12
14	7	\N	14
15	8	\N	13
\.


                                                                                                                                                                                                                                                                                                                                                                         3380.dat                                                                                            0000600 0004000 0002000 00000000704 14441305425 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Shake It Off	219	1	1	Pop
2	Shape of You	236	2	2	Pop
3	Formation	234	3	3	R&B
4	Rolling in the Deep	228	4	4	R&B
5	Yellow	263	5	5	Indie
6	Hotline Bling	267	6	6	Pop
7	Umbrella	263	7	7	R&B
8	Thats What I Like	206	8	8	Funk
9	Bohemian Rhapsody	355	9	9	Rock
10	Empire State of Mind	256	10	10	Rap
11	Bad Romance	294	11	11	Pop
12	Lose Yourself	326	12	12	Pop
13	Firework	227	13	13	Pop
14	With or Without You	296	14	14	Rock
15	Blinding Lights	201	15	15	R&B
\.


                                                            3384.dat                                                                                            0000600 0004000 0002000 00000000072 14441305425 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Basic	9.99	30
2	Premium	14.99	30
3	Family	24.99	30
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                      3377.dat                                                                                            0000600 0004000 0002000 00000001642 14441305425 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Hanifi_Abrar	password123	Hanifigeming@example.com	2003-05-15	1
2	Wira_putu	abc123	wirwir@example.com	2003-09-22	1
3	wildan_gita	wiliking	wiliii@example.com	2003-12-10	2
4	agus_priambodo	agus123	aguss123@example.com	1990-04-15	\N
5	haji_roma	irama123	ILYhajiromairama@example.com	1981-06-13	3
6	rafi_handoko	rafikeren	pastdark@example.com	1984-11-22	3
7	moira_reyna	ngilang123	selfheal@example.com	1956-07-09	\N
8	jett_kiriko	asian123	knifegemink@example.com	1975-06-04	1
9	silver_wolf	bronyakecil	hengkker@example.com	1963-12-18	1
10	raden_shotgun	tukangpln	bukandewa@example.com	1981-06-09	2
11	kumalala_waduh	waduh123	kumalala123@example.com	1974-11-11	\N
12	walter_white	breakbad123	waltergoat@example.com	1990-08-15	3
13	griffin_stewie	brian123	maguirelove@example.com	1965-04-04	2
14	rick_morty	scientist123	dimensioniscool@example.com	1969-05-14	1
15	michael_jordan	jumpman23	michael.jordan@example.com	1963-02-17	\N
\.


                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000025747 14441305425 0015405 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "Music Streaming Service";
--
-- Name: Music Streaming Service; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Music Streaming Service" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';


ALTER DATABASE "Music Streaming Service" OWNER TO postgres;

\connect -reuse-previous=on "dbname='Music Streaming Service'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    album_id integer NOT NULL,
    album_title character varying(100),
    release_date date,
    artist_id integer
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    artist_name character varying(100),
    biography text,
    country character varying(50)
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    history_id integer NOT NULL,
    user_id integer,
    song_id integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    like_id integer NOT NULL,
    user_id integer,
    song_id integer,
    album_id integer
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    playlist_id integer NOT NULL,
    playlist_name character varying(100),
    creator_id integer,
    description text
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendations (
    recommendation_id integer NOT NULL,
    user_id integer,
    song_id integer,
    album_id integer
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    song_title character varying(100),
    duration integer,
    artist_id integer,
    album_id integer,
    song_genre character varying(50)
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    subscription_id integer NOT NULL,
    subscription_name character varying(50),
    price numeric(8,2),
    duration integer
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50),
    password character varying(50),
    email character varying(100),
    date_of_birth date,
    subscription_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (album_id, album_title, release_date, artist_id) FROM stdin;
\.
COPY public.albums (album_id, album_title, release_date, artist_id) FROM '$$PATH$$/3379.dat';

--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (artist_id, artist_name, biography, country) FROM stdin;
\.
COPY public.artists (artist_id, artist_name, biography, country) FROM '$$PATH$$/3378.dat';

--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (history_id, user_id, song_id, "timestamp") FROM stdin;
\.
COPY public.history (history_id, user_id, song_id, "timestamp") FROM '$$PATH$$/3383.dat';

--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (like_id, user_id, song_id, album_id) FROM stdin;
\.
COPY public.likes (like_id, user_id, song_id, album_id) FROM '$$PATH$$/3382.dat';

--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (playlist_id, playlist_name, creator_id, description) FROM stdin;
\.
COPY public.playlists (playlist_id, playlist_name, creator_id, description) FROM '$$PATH$$/3381.dat';

--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommendations (recommendation_id, user_id, song_id, album_id) FROM stdin;
\.
COPY public.recommendations (recommendation_id, user_id, song_id, album_id) FROM '$$PATH$$/3385.dat';

--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (song_id, song_title, duration, artist_id, album_id, song_genre) FROM stdin;
\.
COPY public.songs (song_id, song_title, duration, artist_id, album_id, song_genre) FROM '$$PATH$$/3380.dat';

--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (subscription_id, subscription_name, price, duration) FROM stdin;
\.
COPY public.subscriptions (subscription_id, subscription_name, price, duration) FROM '$$PATH$$/3384.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, email, date_of_birth, subscription_id) FROM stdin;
\.
COPY public.users (user_id, username, password, email, date_of_birth, subscription_id) FROM '$$PATH$$/3377.dat';

--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (like_id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (playlist_id);


--
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (recommendation_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (subscription_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: albums albums_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: history history_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);


--
-- Name: history history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: likes likes_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: likes likes_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);


--
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: playlists playlists_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(user_id);


--
-- Name: recommendations recommendations_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: recommendations recommendations_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);


--
-- Name: recommendations recommendations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: songs songs_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: songs songs_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: users users_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(subscription_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         