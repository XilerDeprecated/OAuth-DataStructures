CREATE TABLE tokens (
    definite VARCHAR(97) NOT NULL PRIMARY KEY,
    app VARCHAR(15) REFERENCES app (id),
    temp VARCHAR(97),
    type SMALLINT REFERENCES token_types (id),
    temp_expiry TIMESTAMP
);