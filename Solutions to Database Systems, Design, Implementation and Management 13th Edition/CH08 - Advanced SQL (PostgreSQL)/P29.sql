CREATE OR REPLACE FUNCTION trigger_func_updatecust_balance2()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
BEGIN
	UPDATE CUSTOMER
	SET CUST_BALANCE = CUST_BALANCE - OLD.INV_AMOUNT
	FROM INVOICE
	WHERE CUSTOMER.CUST_NUM = OLD.CUST_NUM;
	RAISE NOTICE 'trg_updatecustbalance2 was triggered';
	RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_updatecustbalance2
AFTER DELETE ON INVOICE
FOR EACH ROW
EXECUTE PROCEDURE trigger_func_updatecust_balance2();
