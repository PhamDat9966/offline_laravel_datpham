DELIMITER //

CREATE TRIGGER `updateTotalElementsArticle`
AFTER INSERT ON `article`
FOR EACH ROW
BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount + 1
  WHERE `TableName` = 'article';
END //

CREATE TRIGGER `updateTotalElementsAfterUpdateArticle`
AFTER UPDATE ON `article`
FOR EACH ROW
BEGIN
  -- Assuming that the primary key of the article table is 'id'
  IF NEW.id <> OLD.id THEN
    UPDATE `totalelements`
    SET ElementCount = ElementCount + 1
    WHERE `TableName` = 'article';
  END IF;
END //

CREATE TRIGGER `updateTotalElementsAfterDeleteArticle`
AFTER DELETE ON `article`
FOR EACH ROW
BEGIN
  UPDATE `totalelements`
  SET ElementCount = ElementCount - 1
  WHERE `TableName` = 'article';
END //

-- Repeat the above pattern for other tables (category, slider, user) with appropriate table and column names

DELIMITER ;
