CREATE TABLE organisations (
    id VARCHAR(15) NOT NULL PRIMARY KEY,
    owner UUID REFERENCES accounts (id),
    verified BOOLEAN NOT NULL DEFAULT FALSE,
    name VARCHAR(64) NOT NULL,
    avatar VARCHAR(512),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);