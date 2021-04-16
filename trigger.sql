use roommego_sanity;

DELIMITER |

CREATE TRIGGER action_book_category
BEFORE UPDATE
ON booking FOR EACH ROW
BEGIN
	DECLARE bookCategory INT;
	DECLARE bookCategoryStatus INT;

    SET bookCategory = get_book_category(NEW.book_status_id, NEW.book_payment_status_id, NEW.book_deposit_status);
	SET bookCategoryStatus = get_book_category_status(NEW.book_status_id, NEW.book_payment_status_id, NEW.book_deposit_status);

	SET NEW.book_category_id = bookCategory;
	SET NEW.book_category_status_id = bookCategoryStatus;
	SET NEW.book_update_by = "SYSTEM";
	SET NEW.book_update_date = NOW();
END; |

==========================================================

use roommego_sanity;

DELIMITER |

CREATE TRIGGER insert_book_category
BEFORE INSERT
ON booking FOR EACH ROW
BEGIN
    DECLARE bookCategory INT;
	DECLARE bookCategoryStatus INT;

    SET bookCategory = get_book_category(NEW.book_status_id, NEW.book_payment_status_id, NEW.book_deposit_status);
	SET bookCategoryStatus = get_book_category_status(NEW.book_status_id, NEW.book_payment_status_id, NEW.book_deposit_status);

	SET NEW.book_category_id = bookCategory;
	SET NEW.book_category_status_id = bookCategoryStatus;
	SET NEW.book_update_by = "SYSTEM";
	SET NEW.book_update_date = NOW();
END; |


