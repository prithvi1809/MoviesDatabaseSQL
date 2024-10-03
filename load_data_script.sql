-- Disable foreign key checks to allow truncating tables
SET FOREIGN_KEY_CHECKS = 0;

-- Truncate all tables in the correct order (truncate child tables first)
TRUNCATE TABLE ratings;
TRUNCATE TABLE tags;
TRUNCATE TABLE hasagenre;
TRUNCATE TABLE movies;
TRUNCATE TABLE genres;
TRUNCATE TABLE taginfo;
TRUNCATE TABLE users;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- Load data into the 'users' table
LOAD DATA INFILE "test_data\\users.dat"
INTO TABLE users
FIELDS TERMINATED BY '%' 
LINES TERMINATED BY '\n' 
(userid, name);

-- Load data into the 'movies' table
LOAD DATA INFILE "test_data\\movies.dat"
INTO TABLE movies
FIELDS TERMINATED BY '%' 
LINES TERMINATED BY '\n'
(movieid, title);

-- Load data into the 'taginfo' table
LOAD DATA INFILE "test_data\\taginfo.dat"
INTO TABLE taginfo
FIELDS TERMINATED BY '%'
LINES TERMINATED BY '\n'
(tagid, content);

-- Load data into the 'genres' table
LOAD DATA INFILE "test_data\\genres.dat"
INTO TABLE genres
FIELDS TERMINATED BY '%'
LINES TERMINATED BY '\n'
(genreid, name);

-- Load data into the 'ratings' table
LOAD DATA INFILE "test_data\\ratings.dat"
INTO TABLE ratings
FIELDS TERMINATED BY '%'
LINES TERMINATED BY '\n'
(userid, movieid, rating, timestamp);

-- Load data into the 'tags' table
LOAD DATA INFILE 'test_data\\tags.dat'
INTO TABLE tags
FIELDS TERMINATED BY '%' 
LINES TERMINATED BY '\n'
(userid, movieid, tagid, timestamp);

-- Load data into the 'hasagenre' table
LOAD DATA INFILE 'test_data\\hasagenre.dat'
INTO TABLE hasagenre
FIELDS TERMINATED BY '%'
LINES TERMINATED BY '\n'
(movieid, genreid);