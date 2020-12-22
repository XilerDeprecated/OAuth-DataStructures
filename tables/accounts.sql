CREATE TABLE accounts2 (
    id UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(320) NOT NULL UNIQUE,
    avatar VARCHAR(512),
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    password TEXT NOT NULL,
    language VARCHAR(5) NOT NULL DEFAULT 'en'
);

CREATE TRIGGER convert_account_to_lowercase_trigger BEFORE
INSERT
    OR
UPDATE
    ON accounts FOR EACH ROW EXECUTE PROCEDURE convert_account_to_lowercase();