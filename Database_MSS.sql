PGDMP     	    8                {            music    15.2    15.2 ,    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    49846    music    DATABASE     |   CREATE DATABASE music WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE music;
                postgres    false            �            1259    49869    albums    TABLE     �   CREATE TABLE public.albums (
    album_id integer NOT NULL,
    album_title character varying(100),
    release_date date,
    artist_id integer
);
    DROP TABLE public.albums;
       public         heap    postgres    false            �            1259    49862    artists    TABLE     �   CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    artist_name character varying(100),
    biography text,
    country character varying(50)
);
    DROP TABLE public.artists;
       public         heap    postgres    false            �            1259    49926    history    TABLE     �   CREATE TABLE public.history (
    history_id integer NOT NULL,
    user_id integer,
    song_id integer,
    "timestamp" timestamp without time zone
);
    DROP TABLE public.history;
       public         heap    postgres    false            �            1259    49906    likes    TABLE     |   CREATE TABLE public.likes (
    like_id integer NOT NULL,
    user_id integer,
    song_id integer,
    album_id integer
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    49894 	   playlists    TABLE     �   CREATE TABLE public.playlists (
    playlist_id integer NOT NULL,
    playlist_name character varying(100),
    creator_id integer,
    description text
);
    DROP TABLE public.playlists;
       public         heap    postgres    false            �            1259    49941    recommendations    TABLE     �   CREATE TABLE public.recommendations (
    recommendation_id integer NOT NULL,
    user_id integer,
    song_id integer,
    album_id integer
);
 #   DROP TABLE public.recommendations;
       public         heap    postgres    false            �            1259    49879    songs    TABLE     �   CREATE TABLE public.songs (
    song_id integer NOT NULL,
    song_title character varying(100),
    duration integer,
    artist_id integer,
    album_id integer,
    song_genre character varying(50)
);
    DROP TABLE public.songs;
       public         heap    postgres    false            �            1259    49847    subscriptions    TABLE     �   CREATE TABLE public.subscriptions (
    subscription_id integer NOT NULL,
    subscription_name character varying(50),
    price numeric(8,2),
    duration integer
);
 !   DROP TABLE public.subscriptions;
       public         heap    postgres    false            �            1259    49852    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50),
    password character varying(50),
    email character varying(100),
    date_of_birth date,
    subscription_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            4          0    49869    albums 
   TABLE DATA           P   COPY public.albums (album_id, album_title, release_date, artist_id) FROM stdin;
    public          postgres    false    217   �5       3          0    49862    artists 
   TABLE DATA           M   COPY public.artists (artist_id, artist_name, biography, country) FROM stdin;
    public          postgres    false    216   �6       8          0    49926    history 
   TABLE DATA           L   COPY public.history (history_id, user_id, song_id, "timestamp") FROM stdin;
    public          postgres    false    221   s8       7          0    49906    likes 
   TABLE DATA           D   COPY public.likes (like_id, user_id, song_id, album_id) FROM stdin;
    public          postgres    false    220   &9       6          0    49894 	   playlists 
   TABLE DATA           X   COPY public.playlists (playlist_id, playlist_name, creator_id, description) FROM stdin;
    public          postgres    false    219   �9       9          0    49941    recommendations 
   TABLE DATA           X   COPY public.recommendations (recommendation_id, user_id, song_id, album_id) FROM stdin;
    public          postgres    false    222   �;       5          0    49879    songs 
   TABLE DATA           _   COPY public.songs (song_id, song_title, duration, artist_id, album_id, song_genre) FROM stdin;
    public          postgres    false    218   �;       1          0    49847    subscriptions 
   TABLE DATA           \   COPY public.subscriptions (subscription_id, subscription_name, price, duration) FROM stdin;
    public          postgres    false    214   +=       2          0    49852    users 
   TABLE DATA           c   COPY public.users (user_id, username, password, email, date_of_birth, subscription_id) FROM stdin;
    public          postgres    false    215   q=       �           2606    49873    albums albums_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);
 <   ALTER TABLE ONLY public.albums DROP CONSTRAINT albums_pkey;
       public            postgres    false    217            �           2606    49868    artists artists_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);
 >   ALTER TABLE ONLY public.artists DROP CONSTRAINT artists_pkey;
       public            postgres    false    216            �           2606    49930    history history_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
       public            postgres    false    221            �           2606    49910    likes likes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (like_id);
 :   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
       public            postgres    false    220            �           2606    49900    playlists playlists_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (playlist_id);
 B   ALTER TABLE ONLY public.playlists DROP CONSTRAINT playlists_pkey;
       public            postgres    false    219            �           2606    49945 $   recommendations recommendations_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (recommendation_id);
 N   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_pkey;
       public            postgres    false    222            �           2606    49883    songs songs_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);
 :   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_pkey;
       public            postgres    false    218            �           2606    49851     subscriptions subscriptions_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (subscription_id);
 J   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_pkey;
       public            postgres    false    214            �           2606    49856    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    49874    albums albums_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);
 F   ALTER TABLE ONLY public.albums DROP CONSTRAINT albums_artist_id_fkey;
       public          postgres    false    217    216    3209            �           2606    49936    history history_song_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);
 F   ALTER TABLE ONLY public.history DROP CONSTRAINT history_song_id_fkey;
       public          postgres    false    221    218    3213            �           2606    49931    history history_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.history DROP CONSTRAINT history_user_id_fkey;
       public          postgres    false    3207    221    215            �           2606    49921    likes likes_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);
 C   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_album_id_fkey;
       public          postgres    false    3211    217    220            �           2606    49916    likes likes_song_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_song_id_fkey;
       public          postgres    false    218    220    3213            �           2606    49911    likes likes_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_fkey;
       public          postgres    false    3207    215    220            �           2606    49901 #   playlists playlists_creator_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(user_id);
 M   ALTER TABLE ONLY public.playlists DROP CONSTRAINT playlists_creator_id_fkey;
       public          postgres    false    219    215    3207            �           2606    49956 -   recommendations recommendations_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);
 W   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_album_id_fkey;
       public          postgres    false    3211    217    222            �           2606    49951 ,   recommendations recommendations_song_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);
 V   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_song_id_fkey;
       public          postgres    false    218    222    3213            �           2606    49946 ,   recommendations recommendations_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 V   ALTER TABLE ONLY public.recommendations DROP CONSTRAINT recommendations_user_id_fkey;
       public          postgres    false    3207    215    222            �           2606    49889    songs songs_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);
 C   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_album_id_fkey;
       public          postgres    false    218    3211    217            �           2606    49884    songs songs_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);
 D   ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_artist_id_fkey;
       public          postgres    false    216    218    3209            �           2606    49857     users users_subscription_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(subscription_id);
 J   ALTER TABLE ONLY public.users DROP CONSTRAINT users_subscription_id_fkey;
       public          postgres    false    214    3205    215            4   /  x�-PAN�@<ۯ��7�&9� A=D���jM�&�&9�2���m*Y����Weβ7l�+����o��f��a;���4�W�z�2�Ѓ��ac�8s8H�c3O:Ɖ���r\A-�J�t���a�l��D�6t�z���4��&c(��_i/����'h	%V�����L$M���U�DKE�v�qF�:N6ݬ���S���Vq�b|7C�nڑ>��n'O�����06�u�e�H���ݲ�3�U{9+=�K��2�����c3�A5�$\{�Q��&�<�!E�l:���"�wd}      3   �  x��R[N�0�vN�@E
���BP�x�BB�l�%5M��:�ʑ8íC)� �h=�wǳ�	��İ�[���Fj+��0E֑VS��m�K�9rOLɭJ�吣����9"5`�sJq������Q&v�KC��k�ײ%?Y�ܽ��ֶ�퉡�}����86��(k��#���`-�̽�Q�/N�/:�� �,[�P����T�N��@��9��Z�<�<u����
w�vK����668#.��+`ۀ]��V2c��h�G�@$��(�Pn?��VRO���u�12�P\�*��������;u3M����_F�1䥼F���͝�_�Ն�s�b���Ӿ�*�sn��s�ā ���=�T�L���{{A��Ԅ�      8   �   x�U���0D�V4������ȲIF�7oY-�=��O�ɜ�X�!B(3'j�Q�X$��L�;�XVR�N5�����43j�F<vZ7��ހf� �ж6e��_�+ ��͠��$�D�!��n!V�zǻ	�k�9�3�k�E��O^���~�E�      7   Z   x�%���0B�0L��� ��Q��Y2d2�e ��H�4��Q�pp��X,tc�1�3��ilIX&U`�T>P��B��r���}��yH~,|.      6   �  x�UR�n�0<��bO�E�l�ut�pQ�A`��������P\���_ߥl7�Igfg8���^����%��FkBD���>��5!�f���ś��7���~��8�⑰�D�J˳9|l������d��f\�qp|��L%׃E޳S0��K��q2*�cߘ?��S�zV6>���<�9Χh��6N_���m�vl�2'_���g���z9�t4~�.%}��6�<_�K��e�)��<��#~51���D7�7�'N��ò�!DŶ�Z��m���ꪒ�C:3z�:�#W���pQ�ҩ����g�p�k���֤�d�6���;��*�`�p�n6�]b�eQ��z��H6�p��0�i/�"iDk��V��>��8��b%���jj+jq0�M�!͢�gk�3>��T�
^�]���sյ�sk�Z�t�&�V���q��$-��K~�������u��z|xĕuU�.F�6��i��`��)�bU��γ,�u4&      9   W   x�-���0г=LUC�g�N���(D9����h�Qp��zK�zb*M��,��i�<	�#�	Qv��7�Q��QqZ �~H��      5   4  x�%P�j�0<��bO=�H~�WӆRZ���E��Xؖ����]9� !�fW;�N����>�J���O?	�ɐo��oPIňR���G�w|�"a�O�HQ�a��J�Q��3A�-RF|��l��ߡ�c�kD�7�h��vV�ج���;�K���+m���ЉW����j�c���\/JT�3�Վjd���,Cɨ��r��q���c�a�ݺ*���֓��n���vnQ��+��H*�bb@�b��b��\e�����s
��\�':�3����#��i��bML�`�]XxDn�E�~����u      1   6   x�3�tJ,�L�Գ��46�2�(J��,��44�
s�%�f�Tr�Db���� ���      2   �  x�mSˮ�@]�!b ��ݵR�mU�J���y�a�i��6ɦ$�����sf|GOj>ڈ&��[��*�gaЎ��M�E7Y�낃�(���sU��J�M�iI`�	�F��7�s^��/l��(��d����T���l8,s3EB׆>�K�'o	����ȋ������0╚�u(�?�HV�kn�?��8䪂*;@D�hD�օ�Q{�+���}�[eGpA����@� �gm/�F��և�8�T��W�Rc(wř�Ұ/z�e��X�b�"�a&��cs�m��Fwda�~0L�=<�>1���k��cH��!-�YO�C+Q�o��b�e��š嫹a���>W����Y�U1��تd�M�}����F��)�!`z��Iܮ2�l�t����O���چ/������� {�ԙƅ��0w�}�9	�'��L��܅���p^����Du#j�\�<����&�^H<
�G�Ն�m8���,��(�'     