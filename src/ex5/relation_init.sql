CREATE TABLE room_to_flat(
	flat_square SMALLINT NOT NULL UNIQUE, 
	room_square SMALLINT NOT NULL UNIQUE, 
	namepart VARCHAR(300) NOT NULL, 
	decoration VARCHAR(300) NOT NULL, 
	socket SMALLINT NOT NULL CHECK(socket > 0 AND socket < 13), 
	sections SMALLINT NOT NULL CHECK (sections > 0 AND sections < 7), 
	CONSTRAINT fk_flat_square FOREIGN KEY (flat_square) REFERENCES flat(square_hall), 
	FOREIGN KEY(room_square) REFERENCES room(square_part) 
);

 CREATE TABLE construction_description(
 	kadastr_number INTEGER NOT NULL UNIQUE, 
 	year SMALLINT NOT NULL CHECK(year > 1985 AND year < 2022), 
 	material VARCHAR(100) NOT NULL, base VARCHAR(100) NOT NULL, 
 	wear SMALLINT NOT NULL, 
 	flow SMALLINT NOT NULL, 
 	line SMALLINT NOT NULL, 
 	picture VARCHAR(300) NOT NULL UNIQUE, 
 	hall SMALLINT NOT NULL UNIQUE, 
 	elevator BOOLEAN NOT NULL, 
 	CONSTRAINT fk_kadastr_key FOREIGN KEY(kadastr_number) REFERENCES construction(kadastr) 
 );