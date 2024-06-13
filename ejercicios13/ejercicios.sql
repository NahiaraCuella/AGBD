CREATE TABLE user (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 username TEXT UNIQUE NOT NULL,
 password TEXT NOT NULL
);
CREATE TABLE post (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 author_id INTEGER NOT NULL,
 created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 title TEXT NOT NULL,
 body TEXT NOT NULL,
 FOREIGN KEY (author_id) REFERENCES user (id)
);

--2)
INSERT INTO user (username,password)
VALUES("Nahiara","aaa123"), ("Valentina","bbb456");

INSERT INTO post (author_id,title,body)
VALUES ((SELECT id FROM user WHERE username like "Nahiara%"),"Amo nike","Me gusta nike porque los modelos de zapatillas son copados a diferencia de adidas"),
		((SELECT id FROM user WHERE username like "Nahiara%"),"Chicago ","me gusta chicago por los colores"),
		((SELECT id FROM user WHERE username like "Nahiara%"),"Extenciones de pestañas","amo las extenciones de pestañas porque me gusta como me queda"),

		((SELECT id FROM user WHERE username like "Valentina%"),"Boca","soy de boca porque toda mi familia es de boca"),
		((SELECT id FROM user WHERE username like "Valentina%"),"Musica","me encanta escuchar musica"),
		((SELECT id FROM user WHERE username like "Valentina%"),"dia gris","esta nublado porque vine a la escuela temprano y va a llover");

--3)        
INSERT INTO user (username,password)
VALUES("Tomas",(SELECT password FROM user WHERE username like "Nahi%"));

--4)
UPDATE post SET body = ""
WHERE author_id = (SELECT id FROM user WHERE username LIKE "valen%")

--5)
DELETE FROM post WHERE author_id = (SELECT id FROM user WHERE username LIKE "Nahi%")

DELETE FROM user WHERE username like "Nahi%"
