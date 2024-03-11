--This Schema is compaitible with MS SQL Server
-- Create the product_category table
CREATE TABLE product_category (
    id INT PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    created_at DATETIME,
    modified_at DATETIME,
    deleted_at DATETIME
);

-- Create the product_inventory table
CREATE TABLE product_inventory (
    id INT PRIMARY KEY,
	quantity INT NOT NULL,
    created_at DATETIME,
    modified_at DATETIME,
    deleted_at DATETIME
);

-- Create the discount table
CREATE TABLE discount (
    id INT PRIMARY KEY,
	name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
	discount_percent DECIMAL(3,2),
    created_at DATETIME,
    modified_at DATETIME,
    deleted_at DATETIME
);

-- Create the Product table
CREATE TABLE product (
    id INT PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
    SKU NVARCHAR(255),
    category_id INT NOT NULL REFERENCES product_category(id),
    inventory_id INT NOT NULL REFERENCES product_inventory(id),
    price DECIMAL(10, 2),
    discount_id INT NOT NULL REFERENCES discount(id),
    created_at DATETIME,
    modified_at DATETIME,
    deleted_at DATETIME
);

