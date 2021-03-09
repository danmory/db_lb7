CREATE OR REPLACE FUNCTION retrieve_customers(int, int)
RETURNS SETOF customer AS
$$
BEGIN
IF $1<0 OR $2 <0 THEN RAISE EXCEPTION 'negative index';
ELSE
    IF $1 > 600 OR $2 > 600 THEN RAISE EXCEPTION 'out of bound index'; END IF;
END IF;
RETURN QUERY SELECT * FROM customer ORDER BY address_id OFFSET $1-1 LIMIT $2 - $1 + 1;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM retrieve_customers(10, 40);