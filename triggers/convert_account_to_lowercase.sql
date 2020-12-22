CREATE
OR REPLACE FUNCTION convert_account_to_lowercase() RETURNS trigger AS $ convert_account_to_lowercase $ BEGIN NEW.username = LOWER(NEW.username);

NEW.email = LOWER(NEW.email);

RETURN NEW;

END;

$ convert_account_to_lowercase $ LANGUAGE plpgsql;