-- Active: 1763755261268@@127.0.0.1@3306

-- Создать команды для добавления пяти новых пользователей, в том числе себя и четырех ближайших 
-- соседей по списку вашей группы. Дата регистрации должна определяться по системному времени.

INSERT INTO users (name, email, gender, register_date, occupation) 
VALUES ('Пузаков Дмитрий', 'puzakov@mail.ru', 'male', datetime('now', 'localtime'), 'student');

INSERT INTO users (name, email, gender, register_date, occupation) 
VALUES ('Полковников Дмитрий', 'polkovnik0ff@mail.ru', 'male', datetime('now', 'localtime'), 'student');

INSERT INTO users (name, email, gender, register_date, occupation) 
VALUES ('Пшеницына Полина', 'wheatp@mail.ru', 'female', datetime('now', 'localtime'), 'student');

INSERT INTO users (name, email, gender, register_date, occupation) 
VALUES ('Паркаев Василий', 'park@mail.ru', 'male', datetime('now', 'localtime'), 'student');

INSERT INTO users (name, email, gender, register_date, occupation) 
VALUES ('Пяткин Игорь', 'Pyat_igor@mail.ru', 'male', datetime('now', 'localtime'), 'student');

--Создать команды для добавления трех новых фильмов разных жанров.

INSERT INTO movies (title, year)
VALUES ('Anora', 2024);

INSERT INTO movie_genres (movie_id, genre_id)
VALUES (
    (SELECT id FROM movies WHERE title = 'Anora' AND year = 2024),
    (SELECT id FROM genres WHERE name = 'Drama')
);

INSERT INTO movies (title, year)
VALUES ('Perfect Days', 2023);

INSERT INTO movie_genres (movie_id, genre_id)
VALUES (
    (SELECT id FROM movies WHERE title = 'Perfect Days' AND year = 2023),
    (SELECT id FROM genres WHERE name = 'Drama')
);

INSERT INTO movies (title, year)
VALUES ('The Book of Eli', 2009);

INSERT INTO movie_genres (movie_id, genre_id)
VALUES (
    (SELECT id FROM movies WHERE title = 'The Book of Eli' AND year = 2009),
    (SELECT id FROM genres WHERE name = 'Sci-Fi')
);

--Создать команды для добавления трех новых отзывов о добавленных фильмах от себя.
INSERT INTO ratings (user_id, movie_id, rating, timestamp)
VALUES (
    (SELECT id FROM users WHERE email = 'puzakov@mail.ru'),
    (SELECT id FROM movies WHERE title = 'Anora' AND year = 2024),
    4.9,
    strftime('%s', 'now')
);

INSERT INTO ratings (user_id, movie_id, rating, timestamp)
VALUES (
    (SELECT id FROM users WHERE email = 'puzakov@mail.ru'),
    (SELECT id FROM movies WHERE title = 'Perfect Days' AND year = 2023),
    5,
    strftime('%s', 'now')
);


INSERT INTO ratings (user_id, movie_id, rating, timestamp)
VALUES (
    (SELECT id FROM users WHERE email = 'puzakov@mail.ru'),
    (SELECT id FROM movies WHERE title = 'The Book of Eli' AND year = 2009),
    2.4,
    strftime('%s', 'now')
);