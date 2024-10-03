DROP TABLE IF EXISTS query1;

create table if not exists query1 as
	select genres.name as name, COUNT(hasagenre.movieid) as moviecount
	from hasagenre INNER JOIN genres ON hasagenre.genreid = genres.genreid
	group by genres.name;


DROP TABLE IF EXISTS query2;

create table if not exists query2 as
	select genres.name as name, AVG(r.rating) as rating 
    from hasagenre as hg INNER JOIN ratings as r ON hg.movieid = r.movieid
						INNER JOIN genres ON hg.genreid = genres.genreid
    group by genres.name;


DROP TABLE IF EXISTS query3;

CREATE TABLE IF NOT EXISTS query3 AS
	select m.title as title, COUNT(r.rating) as countofratings
    from movies as m INNER JOIN ratings as r ON m.movieid = r.movieid
    group by m.title
    HAVING COUNT(r.rating)>=10;

DROP TABLE IF EXISTS query4;

CREATE TABLE IF NOT EXISTS query4 as
	select m.movieid as movieid, m.title as title
    from hasagenre as hg INNER JOIN movies as m ON hg.movieid = m.movieid
						INNER JOIN genres as g ON hg.genreid = g.genreid 
	where g.name = 'Comedy';

DROP TABLE IF EXISTS query5;

CREATE TABLE IF NOT EXISTS query5 as
    select m.title, AVG(r.rating) as average
    from ratings as r INNER JOIN movies as m ON r.movieid = m.movieid
    group by m.title;

DROP TABLE IF EXISTS query6;

create table if not exists query6 as
	select AVG(rating) as average
    from ratings
    where movieid in (
		select m.movieid
		from hasagenre as hg INNER JOIN movies as m ON hg.movieid = m.movieid
							INNER JOIN genres as g ON hg.genreid = g.genreid 
		where g.name = 'Comedy'
	);

DROP TABLE IF EXISTS query7;

create table if not exists query7 as
	select AVG(rating) as average
    from ratings
    where movieid in (
		select m.movieid
		from hasagenre as hg INNER JOIN movies as m ON hg.movieid = m.movieid
							INNER JOIN genres as g ON hg.genreid = g.genreid 
		WHERE g.name IN ('Comedy', 'Romance')
		GROUP BY m.movieid
		HAVING COUNT(DISTINCT g.name) = 2
	);

DROP TABLE IF EXISTS query8;

create table if not exists query8 as
	select AVG(rating) as average
    from ratings
    where movieid in (
		select m.movieid
		from hasagenre as hg INNER JOIN movies as m ON hg.movieid = m.movieid
							INNER JOIN genres as g ON hg.genreid = g.genreid 
		GROUP BY m.movieid
		HAVING SUM(CASE WHEN g.name = 'Romance' THEN 1 ELSE 0 END) > 0
		AND SUM(CASE WHEN g.name = 'Comedy' THEN 1 ELSE 0 END) = 0
	);

DROP TABLE IF EXISTS query9;

CREATE TABLE IF NOT EXISTS query9 (
    movieid INT,
    rating NUMERIC
);

DO $$
DECLARE
	v1 INTEGER := 1;
BEGIN
    INSERT INTO query9 (movieid, rating)
    SELECT movieid, rating
    FROM users INNER JOIN ratings ON users.userid = ratings.userid
    WHERE users.userid = v1;
END $$;

-- SELECT * FROM query9;
select * from query9;