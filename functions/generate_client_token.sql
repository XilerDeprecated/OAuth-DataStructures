CREATE OR REPLACE FUNCTION public.generate_client_token()
    RETURNS text
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
BEGIN
    RETURN CONCAT(generate_token(64), '.', generate_token(23), '#', generate_token(8));
END;
$BODY$;