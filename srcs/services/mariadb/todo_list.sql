CREATE TABLE IF NOT EXISTS to_do_list(
	id			BIGINT PRIMARY KEY,
	name		TEXT NOT NULL,
	done		BOOLEAN NOT NULL
);
