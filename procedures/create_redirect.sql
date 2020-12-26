CREATE OR REPLACE PROCEDURE public.create_redirect(IN app character varying, IN target character varying)
    LANGUAGE 'plpgsql'
    
AS $BODY$
DECLARE
    code TEXT;
BEGIN
    loop
        code := generate_token(4);
        BEGIN
            INSERT INTO redirects (id, app, target) VALUES (code, app, target);
            EXIT;
        EXCEPTION
            WHEN unique_violation THEN
        END;
    end loop;
END;
$BODY$;