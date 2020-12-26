CREATE OR REPLACE FUNCTION public.generate_token(IN length integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
    
AS $BODY$
BEGIN
    RETURN LOWER(SUBSTRING(MD5('' || NOW()::TEXT || RANDOM()::TEXT) FOR length));
END;
$BODY$;