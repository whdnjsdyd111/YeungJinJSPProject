CREATE TABLE member (
	mem_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mem_email VARCHAR(254) NOT NULL,
	mem_passwd VARCHAR(18) NOT NULL,
	mem_nickname VARCHAR(10) NOT NULL,
	mem_ex SMALLINT DEFAULT 0,
	mem_level TINYINT DEFAULT 1,
	mem_date TIMESTAMP NOT NULL);

CREATE TABLE kind (
	kind_id TINYINT NOT NULL PRIMARY KEY,
	kind_name CHAR(16) NOT NULL);

CREATE TABLE board (
	board_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT ,
	board_userid INTEGER NOT NULL REFERENCES member(mem_id),
	board_kind TINYINT NOT NULL REFERENCES kind(kind_id),
	board_title VARCHAR(100) NOT NULL,
	board_content TEXT NOT NULL,
	board_date TIMESTAMP NOT NULL,
	board_images MEDIUMTEXT,
	board_reco MEDIUMINT DEFAULT 0,
	board_nonReco MEDIUMINT DEFAULT 0,
	board_readcount INTEGER DEFAULT 0);

CREATE TABLE comment (
	com_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	com_mem_id INTEGER NOT NULL REFERENCES member(mem_id),
	com_bd_id INTEGER NOT NULL REFERENCES board(board_id),
	com_content TEXT NOT NULL,
	com_reco INTEGER DEFAULT 0,
	com_nest INTEGER REFERENCES comment(com_id));

CREATE TABLE bookmark (
	mem_id INTEGER NOT NULL REFERENCES member(mem_id),
	board_id INTEGER NOT NULL REFERENCES board(board_id)
);