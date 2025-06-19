SELECT c.item_id, c.item_name, c.rarity
FROM item_tree t
JOIN item_info p ON t.parent_item_id = p.item_id
JOIN item_info c ON t.item_id = c.item_id
WHERE p.rarity = 'RARE'
ORDER BY c.item_id DESC;