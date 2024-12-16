SELECT
    r.name AS recipient_name,
    g.gift_name,
    g.price,
    g.purchased
FROM
    gifts g
JOIN
    recipients r ON g.recipient_id = r.id
ORDER BY
    r.name, g.gift_name;