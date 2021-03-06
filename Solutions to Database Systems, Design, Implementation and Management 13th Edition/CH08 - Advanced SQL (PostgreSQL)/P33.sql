CREATE OR REPLACE VIEW view_INV_SUBTOTAL2
AS 
SELECT INV_NUMBER, SUM(LINE_TOTAL) AS INV_SUBT
	FROM LINEZ
	GROUP BY INV_NUMBER;

CREATE OR REPLACE PROCEDURE prc_inv_amounts (
	NUM INVOICEZ.INV_NUMBER%TYPE)
LANGUAGE SQL
AS $$
	UPDATE INVOICEZ
	SET INV_SUBTOTAL = INV_SUBT
	FROM view_INV_SUBTOTAL2
	WHERE INVOICEZ.INV_NUMBER = view_INV_SUBTOTAL2.INV_NUMBER;
	
	UPDATE INVOICEZ
	SET INV_TAX = INV_SUBTOTAL * 0.08
	WHERE INVOICEZ.INV_NUMBER = NUM;

	UPDATE INVOICEZ
	SET INV_TOTAL = INV_SUBTOTAL * 1.08
	WHERE INVOICEZ.INV_NUMBER = NUM;
$$;
