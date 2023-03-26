CREATE table IF NOT EXISTS Genres (
genre_id SERIAL PRIMARY KEY,
name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Singers (
singer_id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresSingers (
id SERIAL PRIMARY KEY,
genre_id INTEGER NOT NULL REFERENCES Genres(genre_id),
singer_id INTEGER NOT NULL REFERENCES Singers(singer_id)
);

CREATE TABLE IF NOT EXISTS Albums (
album_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
release_year DATE NOT NULL CHECK (release_year > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS SingersAlbums (
id SERIAL PRIMARY KEY,
singer_id INTEGER NOT NULL REFERENCES Singers(singer_id),
album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
track_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
duration INTEGER NOT null CHECK (duration between 1 and 10000)
);

CREATE TABLE IF NOT EXISTS AlbumsTracks (
id SERIAL PRIMARY KEY,
album_id INTEGER NOT NULL REFERENCES Albums(album_id),
track_id INTEGER NOT NULL REFERENCES Tracks(track_id)
);

CREATE TABLE IF NOT EXISTS Collections (
collection_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
release_year DATE NOT NULL CHECK (release_year > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS TracksCollections (
id SERIAL PRIMARY KEY,
track_id INTEGER NOT NULL REFERENCES Tracks(track_id),
collection_id INTEGER NOT NULL REFERENCES Collections(collection_id)
);

INSERT INTO Singers VALUES (1, 'twenty one pilots'), (2, 'Queen'), (3, 'Adele'), (4, 'Enimen'), (5, 'Green Day'), (6, 'Linkin Park'), (7, 'Ed Sheeran'), (8, 'The Weeknd');

INSERT INTO Genres VALUES (1, 'рок'), (2, 'поп'), (3, 'рэп'), (4, 'джаз'), (5, 'соул');

INSERT INTO Albums VALUES (1, 'Scaled and Icy', '2021-05-21'), (2, 'Made in Heaven', '1995-11-06'), (3, 'Thirty', '2021-11-19'), (4, 'Revival', '2017-12-15'), (5, 'Bullet in a Bible', '2015-11-15'), (6, 'Meteora', '2003-03-25'), (7, 'Plus', '2011-09-09'), (8, 'Starboy', '2016-11-25');

INSERT INTO Tracks VALUES (1, 'Bounce Man', 185), (2, 'Good Day', 204), (3, 'I Was Born to Love You', 289), (4, 'Let Me Live', 289),(5, 'Easy on Me', 224), (6, 'I Drink Wine', 376), (7, 'Believe', 315), (8, 'River', 221), (9, 'American Idiot', 272), (10, 'Holiday', 252), (11, 'Somewhere I Belong', 214), (12, 'Numb', 188), (13, 'Wake Me Up', 229), (14, 'Give Me Love', 526), (15, 'I Feel It Coming', 269), (16, 'Sidewalks', 231);

INSERT INTO Collections VALUES (1, 'Rock Hits', '2005-05-13'), (2, 'Best songs ever', '1998-10-06'), (3, 'New wave', '2020-06-19'), (4, 'Feel the rhythm', '2013-01-01'), (5, 'Favorite songs', '2007-08-15'), (6, 'In my heart', '2009-04-25'), (7, 'Love songs', '2018-09-23'), (8, 'Dance music', '2022-10-10');

INSERT INTO GenresSingers VALUES (1, 1, 1), (2, 1, 2), (3, 2, 3), (4, 5, 3),(5, 3, 4), (6, 1, 5),  (7, 1, 6),  (8, 2, 7),  (9, 2, 8);

INSERT INTO SingersAlbums VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4),(5, 5, 5), (6, 6, 6),  (7, 7, 7),  (8, 8, 8);

INSERT INTO AlbumsTracks VALUES (1, 1, 1), (2, 1, 2), (3, 2, 3), (4, 2, 4),(5, 3, 5), (6, 3, 6),  (7, 4, 7),  (8, 4, 8),  (9, 5, 9),  (10, 5, 10),  (11, 6, 11),  (12, 6, 12),  (13, 7, 13),  (14, 7, 14),  (15, 8, 15),  (16, 8, 16);

INSERT INTO TracksCollections VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4),(5, 5, 5), (6, 6, 6),  (7, 7, 7),  (8, 8, 8),  (9, 9, 1),  (10, 10, 2),  (11, 11, 3),  (12, 12, 4),  (13, 13, 5),  (14, 14, 6),  (15, 15, 7),  (16, 16, 8);

