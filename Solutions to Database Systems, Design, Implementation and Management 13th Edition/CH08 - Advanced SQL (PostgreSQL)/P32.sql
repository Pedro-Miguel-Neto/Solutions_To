CREATE OR REPLACE FUNCTION trg_func_line_prod()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
BEGIN
	CASE TG_OP
	WHEN 'INSERT' THEN
		UPDATE PRODUCT
		SET P_QOH = P_QOH - NEW.LINE_UNITS
		FROM LINE
		WHERE PRODUCT.P_CODE = NEW.P_CODE;
		RAISE NOTICE 'trg_line_prod was triggered - ON INSERT';
	WHEN 'DELETE' THEN
		UPDATE PRODUCT
		SET P_QOH = P_QOH + OLD.LINE_UNITS
		FROM LINE
		WHERE PRODUCT.P_CODE = OLD.P_CODE;
		RAISE NOTICE 'trg_line_prod was triggered - ON DELETE';
	ELSE
      RAISE EXCEPTION 'This trigger function expects INSERT or UPDATE!';
	END CASE;
	RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_line_prod
AFTER INSERT OR DELETE ON LINE
FOR EACH ROW
EXECUTE PROCEDURE trg_func_line_prod();