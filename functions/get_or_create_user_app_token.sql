CREATE OR REPLACE FUNCTION public.get_or_create_user_app_token(IN _app varchar(15), IN _acc uuid, IN _type smallint) 
	RETURNS TABLE(
		access_token varchar(97),
		app varchar(15),
		refresh_token varchar(97),
		token_type smallint,
		expires_in timestamp
	)
	LANGUAGE 'plpgsql'
	VOLATILE
	PARALLEL UNSAFE
AS $BODY$
BEGIN
	CALL create_token(_app, _type, _acc);
	RETURN QUERY SELECT 
				tokens.definite AS access_token,
				tokens.app,
				tokens.temp AS refresh_token,
				tokens.type AS token_type,
				tokens.temp_expiry AS expires_in
			FROM tokens
			WHERE tokens.app = _app
			  AND tokens.account = _acc;
 END;
$BODY$;