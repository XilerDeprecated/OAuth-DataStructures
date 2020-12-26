CREATE OR REPLACE PROCEDURE public.create_token(IN app character varying, IN type smallint, IN acc uuid)
    LANGUAGE 'plpgsql'
    
AS $BODY$
DECLARE
    code TEXT;
BEGIN
    loop
        code := generate_client_token();
        BEGIN
            IF type IN (SELECT id FROM token_types AS tt WHERE tt.type IN ('Bearer')) THEN
                INSERT INTO tokens (definite, app, temp, type, temp_expiry, account)
                VALUES (code, app, generate_client_token(), type, now() + INTERVAL '7 day', acc);
            ELSE
                INSERT INTO tokens (definite, app, type, account) VALUES (code, app, type, acc);
            END IF;
            EXIT;
        EXCEPTION
            WHEN unique_violation THEN
        END;
    end loop;
END;
$BODY$;