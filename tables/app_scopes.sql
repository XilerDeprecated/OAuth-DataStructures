CREATE TABLE app_scopes (
    id VARCHAR(15) REFERENCES app (id),
    scope_id SMALLINT REFERENCES token_types (id)
);