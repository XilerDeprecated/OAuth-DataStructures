CREATE FUNCTION generate_client_token() RETURNS TEXT AS $ $ BEGIN RETURN CONCAT(
    generate_token(64),
    '.',
    generate_token(23),
    '#',
    generate_token(8)
);

END;

$ $ LANGUAGE plpgsql;