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
