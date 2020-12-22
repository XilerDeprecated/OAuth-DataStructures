CREATE
OR REPLACE FUNCTION generate_token(length INTEGER) RETURNS TEXT AS $ $ BEGIN RETURN LOWER(
    SUBSTRING(
        MD5('' || NOW() :: TEXT || RANDOM() :: TEXT) FOR length
    )
);

END;

$ $ LANGUAGE plpgsql;