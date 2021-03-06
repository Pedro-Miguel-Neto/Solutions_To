CREATE OR REPLACE PROCEDURE prc_new_detail(
	NUM DETAILRENTAL.VID_NUM%TYPE)

LANGUAGE PLPGSQL
AS $$

DECLARE
	RENTFEE 		NUMERIC(4,1);
	DAILYLATEFEE 	NUMERIC(4,1);
	RENTDAYS 		INTEGER;
	DUEDATE 		DATE;

BEGIN

	IF NUM IN (SELECT VID_NUM FROM VIDEO) THEN
		IF (SELECT VID_STATUS FROM VIDEO WHERE VID_NUM = NUM) = 'IN' THEN

			RENTFEE = (SELECT PRICE_RENTFEE
						FROM (VIDEO INNER JOIN MOVIE ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM) 
						INNER JOIN PRICE ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE
						WHERE VIDEO.VID_NUM = NUM);

			DAILYLATEFEE = (SELECT PRICE_DAILYLATEFEE
							FROM (VIDEO INNER JOIN MOVIE ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM) 
							INNER JOIN PRICE ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE
							WHERE VIDEO.VID_NUM = NUM);

			RENTDAYS = (SELECT PRICE_RENTDAYS
							FROM (VIDEO INNER JOIN MOVIE ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM) 
							INNER JOIN PRICE ON MOVIE.PRICE_CODE = PRICE.PRICE_CODE
							WHERE VIDEO.VID_NUM = NUM);

			DUEDATE = CURRENT_DATE + RENTDAYS;

			INSERT INTO DETAILRENTAL VALUES (currval('rent_num_seq'), NUM, RENTFEE, DUEDATE, NULL, DAILYLATEFEE);

		ELSE
			RAISE NOTICE 'Video % must be returned before it can be rented again.', NUM;
		END IF;
	ELSE
		RAISE NOTICE 'Video % does not exist.', NUM;
	END IF;
END;
$$;