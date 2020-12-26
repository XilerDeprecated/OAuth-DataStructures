CREATE OR REPLACE PROCEDURE public.create_organisation(IN owner uuid, IN name character varying)
    LANGUAGE 'plpgsql'
    
AS $BODY$
DECLARE
    code TEXT;
BEGIN
    loop
        code := generate_token(14);
        BEGIN
            INSERT INTO organisations (id, owner, name) VALUES (code, owner, name);
            EXIT;
        EXCEPTION
            WHEN unique_violation THEN
        END;
    end loop;
END;
$BODY$;