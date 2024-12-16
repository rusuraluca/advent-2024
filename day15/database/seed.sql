INSERT INTO recipients (name, relation, notes) VALUES
('Alice', 'Sister', 'Likes books'),
('Bob', 'Friend', 'Prefers tech gadgets'),
('Carol', 'Colleague', 'Enjoys gourmet coffee');

INSERT INTO gifts (recipient_id, gift_name, price, purchased) VALUES
(1, 'Mystery Novel', 15.99, FALSE),
(1, 'Gift Card', 25.00, TRUE),
(2, 'Bluetooth Speaker', 49.99, TRUE),
(2, 'Charging Cable', 12.99, FALSE),
(3, 'Coffee Sampler', 29.99, TRUE);
