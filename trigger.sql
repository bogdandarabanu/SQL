CREATE TRIGGER update_stock
ON Borrow
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @item_id int;
    IF EXISTS(SELECT 1 FROM inserted)
        SET @item_id = (SELECT item_id FROM inserted);
    ELSE
        SET @item_id = (SELECT item_id FROM deleted);
    
    UPDATE Items SET Quantity = Quantity + (SELECT COUNT(*) FROM Borrow WHERE item_id = @item_id AND return_date IS NULL) WHERE item_id = @item_id;
END;
