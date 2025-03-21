-- -- How many drivers
-- SELECT COUNT(*) FROM driver;

-- -- How many deliveries each store made
-- SELECT store.location, count(delivery.driver_id) AS deliveries
--   FROM store
--   INNER JOIN driver ON store.id = driver.store_id
--   INNER JOIN delivery ON driver.id = delivery.driver_id
--   GROUP BY store.location
--   ORDER BY deliveries DESC;

-- -- How many deliveries each driver made
-- Select driver.full_name, COUNT(driver.id) AS deliveries
--   FROM driver
--   INNER JOIN delivery ON driver.id = delivery.driver_id
--   GROUP BY delivery.driver_id, driver.full_name
--   ORDER BY deliveries DESC;

-- -- Driver with the shortest delivery time
-- SELECT 
--     driver.full_name, 
--     MIN(delivery.completed_delivery - delivery.started_delivery) as delivery_time
--   FROM delivery
--   INNER JOIN driver ON delivery.driver_id = driver.id
--   GROUP BY driver.full_name
--   ORDER BY delivery_time ASC
--   LIMIT 1;

-- -- Driver with the longest delivery time
-- SELECT
--     driver.full_name,
--     MAX(delivery.completed_delivery - delivery.started_delivery) as delivery_time
--   FROM delivery
--   INNER JOIN driver ON delivery.driver_id = driver.id
--   GROUP BY driver.full_name
--   ORDER BY delivery_time DESC
--   LIMIT 1;

-- Money made on each(seperate) order
WITH topping_temp AS (
  SELECT 
      pzo.id, unnest(pzo.toppings)::INTEGER as toppings_id, pzo.pizza_type as pizza_type
    FROM pizza_order AS pzo
    FULL JOIN available_pizza AS ap ON pzo.pizza_type = ap.name
)
SELECT 
    -- topping_temp.id, available_pizza.name
    available_pizza.name
  FROM topping_temp
  JOIN available_topping ON topping_temp.toppings_id = available_topping.id
  FULL JOIN available_pizza ON topping_temp.pizza_type = available_pizza.name;
  -- GROUP BY topping_temp.id
  -- ORDER BY topping_temp.id ASC;


-- SELECT
--     (unnest(pzo.toppings) ) 
--   FROM pizza_order AS pzo
--   FULL JOIN available_topping AS avt ON pzo.