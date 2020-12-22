CREATE
OR REPLACE PROCEDURE create_token(app VARCHAR(15), type SMALLINT) AS $ $ DECLARE code TEXT;

BEGIN LOOP code := generate_client_token();

BEGIN IF type IN (
    SELECT
        id
    FROM
        token_types AS tt
    WHERE
        tt.type IN ('Bearer')
) THEN
INSERT INTO
    tokens (definite, app, temp, type, temp_expiry)
VALUES
    (
        code,
        app,
        generate_client_token(),
        type,
        NOW() + INTERVAL '7 day'
    );

ELSE
INSERT INTO
    tokens (definite, app, type)
VALUES
    (code, app, type);

END IF;

EXIT;

EXCEPTION
WHEN unique_violation THEN
END;

LOOP LOOP;

END;

$ $ LANGUAGE plpgsql;