CREATE TABLE recipients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    relation VARCHAR(50),
    notes TEXT
);

CREATE TABLE gifts (
    id SERIAL PRIMARY KEY,
    recipient_id INT REFERENCES recipients(id),
    gift_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    purchased BOOLEAN DEFAULT FALSE,
    UNIQUE (recipient_id, gift_name)
);
