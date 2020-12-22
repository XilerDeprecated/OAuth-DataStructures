CREATE
OR REPLACE PROCEDURE create_redirect(app VARCHAR(15), target VARCHAR(512)) AS $ $ DECLARE code TEXT;

BEGIN LOOP code := generate_token(4);

BEGIN
INSERT INTO
    redirects (id, app, target)
VALUES
    (code, app, target);

EXIT;

EXCEPTION
WHEN unique_violation THEN
END;

END LOOP;

END;

$ $ LANGUAGE plpgsql;