CREATE OR REPLACE PROCEDURE public.create_app(IN organisation character varying)
    LANGUAGE 'plpgsql'
    
AS $BODY$
DECLARE
    code TEXT;
BEGIN
    loop
        code := generate_token(5);
        BEGIN
            INSERT INTO apps (id, organisation) VALUES (code, organisation);
            EXIT;
        EXCEPTION
            WHEN unique_violation THEN
        END;
    end loop;
END;
$BODY$;