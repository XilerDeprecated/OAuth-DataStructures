CREATE TABLE apps (
    id VARCHAR(15) NOT NULL PRIMARY KEY,
    organisation VARCHAR(15) REFERENCES organisations (id)
);