-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    userid INT PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the 'movies' table
CREATE TABLE IF NOT EXISTS movies (
    movieid INT PRIMARY KEY,
    title TEXT NOT NULL
);

-- Create the 'taginfo' table
CREATE TABLE IF NOT EXISTS taginfo (
    tagid INT PRIMARY KEY,
    content TEXT NOT NULL
);

-- Create the 'genre' table
CREATE TABLE IF NOT EXISTS genres	 (
	genreid INT PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the 'ratings' table
CREATE TABLE IF NOT EXISTS ratings (
    userid INT,
    movieid INT,
    rating NUMERIC CHECK (rating >= 0 AND rating <= 5),
    timestamp BIGINT NOT NULL,
    PRIMARY KEY (userid, movieid),
    FOREIGN KEY (userid) REFERENCES users(userid),
    FOREIGN KEY (movieid) REFERENCES movies(movieid)
);

-- Create the 'tags' table
CREATE TABLE IF NOT EXISTS tags (
    userid INT,
    movieid INT,
    tagid INT,
    timestamp BIGINT NOT NULL, -- timestamp is in seconds since epoch
    PRIMARY KEY (userid, movieid, tagid), -- a user can tag a movie with the same tag only once at a time
    FOREIGN KEY (userid) REFERENCES users(userid),
    FOREIGN KEY (movieid) REFERENCES movies(movieid),
    FOREIGN KEY (tagid) REFERENCES taginfo(tagid)
);

-- Create the 'hasagenre' table
CREATE TABLE IF NOT EXISTS hasagenre (
    movieid INT,
    genreid INT,
    PRIMARY KEY (movieid, genreid), -- a movie can have multiple genres
    FOREIGN KEY (movieid) REFERENCES movies(movieid),
    FOREIGN KEY (genreid) REFERENCES genres(genreid)
);
