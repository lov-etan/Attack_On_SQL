SELECT factory_id, factory_name, address
FROM food_factory
WHERE left(address, 3) = '강원도'
ORDER BY factory_id