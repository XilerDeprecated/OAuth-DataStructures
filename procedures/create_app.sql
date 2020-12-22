CREATE
OR REPLACE PROCEDURE create_app(organisation VARCHAR(15)) AS $ $ DECLARE code TEXT;

BEGIN LOOP code := generate_token(5);

BEGIN
INSERT INTO
    apps (id, organisation)
VALUES
    (code, organisation);

EXIT;

EXCEPTION
WHEN unique_violation THEN
END;

END LOOP;

END;

$ $ LANGUAGE plpgsql;