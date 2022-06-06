CREATE OR REPLACE PROCEDURE prc_return_video(
	NUM VIDEO.VID_NUM%TYPE)

LANGUAGE PLPGSQL
AS $$
BEGIN
	IF NUM IN (SELECT VID_NUM FROM VIDEO) THEN
		IF (SELECT COUNT(VID_NUM) 
			FROM DETAILRENTAL 
			WHERE VID_NUM = NUM AND DETAIL_RETURNDATE IS NULL) > 1 THEN
			RAISE NOTICE 'Video % has multiple outstanding rentals.', NUM;

		ELSIF (SELECT COUNT(VID_NUM) 
			FROM DETAILRENTAL 
			WHERE VID_NUM = NUM AND DETAIL_RETURNDATE IS NULL) = 0 THEN

			UPDATE VIDEO
			SET VID_STATUS = 'IN'
			WHERE VID_NUM = NUM;
			RAISE NOTICE 'Video % had no outstanding rentals but is now available for rental.', NUM;

		ELSE
			UPDATE VIDEO
			SET VID_STATUS = 'IN'
			WHERE VID_NUM = NUM;
			UPDATE DETAILRENTAL
			SET DETAIL_RETURNDATE = CURRENT_DATE
			WHERE VID_NUM = NUM AND DETAIL_RETURNDATE IS NULL;
			RAISE NOTICE 'Video % has been successfully returned and is now available for rental.', NUM;
		END IF;
	ELSE
		RAISE NOTICE 'Video % does not exist.', NUM;
	END IF;
END;
$$;