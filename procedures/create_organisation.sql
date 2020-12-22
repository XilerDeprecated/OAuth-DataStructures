CREATE
OR REPLACE PROCEDURE create_organisation(owner UUID, name VARCHAR(64)) AS $ $ DECLARE code TEXT;

BEGIN LOOP code := generate_token(14);

BEGIN
INSERT INTO
    organisations (id, owner, name)
VALUES
    (code, owner, name);

EXIT;

EXCEPTION
WHEN unique_violation THEN
END;

END LOOP;

END;

$ $ LANGUAGE plpgsql;