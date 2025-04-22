CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       username VARCHAR(100) NOT NULL,
                       email VARCHAR(255) NOT NULL
);

CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          stock INT DEFAULT 0
);

CREATE TABLE orders (
                        id SERIAL PRIMARY KEY,
                        product_id INT NOT NULL REFERENCES products(id),
                        quantity INT NOT NULL,
                        status VARCHAR(50) DEFAULT 'pending'
);

-- Trigger per actualitzar stock quan una ordre es paga
CREATE OR REPLACE FUNCTION update_stock()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'paid' THEN
        UPDATE products
        SET stock = stock - NEW.quantity
        WHERE id = NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER order_paid_trigger
    AFTER UPDATE ON orders
    FOR EACH ROW
    WHEN (NEW.status = 'paid' AND OLD.status IS DISTINCT FROM 'paid')
EXECUTE PROCEDURE update_stock();
