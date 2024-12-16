SELECT
    r.name AS recipient_name,
    COUNT(g.id) AS total_gifts,
    SUM(g.price) AS total_cost,
    SUM(CASE WHEN g.purchased THEN g.price ELSE 0 END) AS purchased_cost
FROM
    gifts g
JOIN
    recipients r ON g.recipient_id = r.id
GROUP BY
    r.name
ORDER BY
    total_cost DESC;