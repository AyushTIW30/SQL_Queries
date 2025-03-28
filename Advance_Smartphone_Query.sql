-- This query selects the 'model' and 'screen_size' for Oppo smartphones, ordered by screen size in descending order, limiting the result to the top 5 entries.
SELECT model, screen_size FROM campusx.smartphones WHERE brand_name = "oppo" ORDER BY screen_size DESC LIMIT 5;

-- This query selects the 'model' and calculates the total number of cameras (sum of rear and front cameras) for all smartphones, ordering by the total number of cameras in descending order.
SELECT model, num_rear_cameras + num_front_cameras AS "Camera" FROM campusx.smartphones ORDER BY Camera DESC;

-- This query calculates the PPI (Pixel Per Inch) of each smartphone using the resolution and screen size, and orders by the PPI in descending order.
SELECT model, ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height) / SCREEN_SIZE) AS "PPI" FROM campusx.smartphones ORDER BY PPI DESC;

-- This query selects the 'model' and 'battery_capacity', ordering by battery capacity, and skipping the first entry to return the second row.
SELECT model, battery_capacity FROM campusx.smartphones ORDER BY battery_capacity LIMIT 1,1;

-- This query selects all columns from the smartphones table, and sorts the results by brand name (ascending), price (descending), and rating (descending).
SELECT * FROM campusx.smartphones ORDER BY brand_name ASC, price DESC, rating DESC;

-- This query groups the data by 'brand_name' and aggregates several statistics for each brand: count of phones, average price, max rating, average screen size, and average battery capacity. Results are ordered by the number of phones in descending order, limited to the top 5.
SELECT brand_name, COUNT(*) AS "num_phone", ROUND(AVG(price)) AS "AVG_PRICE", MAX(rating) as "max_rated", ROUND(AVG(screen_size)) AS "Screen_size", ROUND(AVG(battery_capacity)) AS "Battery" FROM campusx.smartphones GROUP BY brand_name ORDER BY num_phone DESC LIMIT 5;

-- This query groups by 'has_nfc' and calculates the average price and average rating for smartphones that have NFC.
SELECT has_nfc, AVG(price) AS "avg price", AVG(rating) AS "rating" FROM campusx.smartphones GROUP BY has_nfc;

-- This query groups by 'has_5g' and calculates the ceiling value of the average price and the average rating for smartphones with or without 5G.
SELECT has_5g, CEIL(AVG(price)) AS "avg price", AVG(rating) AS "rating" FROM campusx.smartphones GROUP BY has_5g;

-- This query groups by 'fast_charging_available' and calculates the average price and average rating for smartphones with or without fast charging.
SELECT fast_charging_available, AVG(price) AS "avg price", AVG(rating) AS "rating" FROM campusx.smartphones GROUP BY fast_charging_available;

-- This query groups by 'extended_memory_available' and calculates the average price and average rating for smartphones with or without extended memory.
SELECT extended_memory_available, AVG(price) AS "avg price", AVG(rating) AS "rating" FROM campusx.smartphones GROUP BY extended_memory_available;

-- This query groups the data by both 'brand_name' and 'processor_brand' and calculates the number of phones and the average primary camera resolution for each brand and processor combination.
SELECT brand_name, processor_brand, os, COUNT(*) AS "num phone", AVG(primary_camera_rear) AS "avg camera resolution" FROM campusx.smartphones GROUP BY brand_name, processor_brand;

-- This query groups by 'brand_name' and calculates the average price for each brand, ordering the results by average price in descending order, limiting to the top 5 brands.
SELECT brand_name, AVG(price) AS "avg_price" FROM campusx.smartphones GROUP BY brand_name ORDER BY avg_price DESC LIMIT 5;

-- This query groups by 'brand_name' and calculates the average screen size for each brand, ordered by the screen size in descending order, limiting to the top 5 brands.
SELECT brand_name, ROUND(AVG(screen_size)) AS "screen" FROM campusx.smartphones GROUP BY brand_name ORDER BY screen DESC LIMIT 5;

-- This query groups by 'brand_name' and filters to include only those brands with NFC and IR blaster available, and where the count of phones is greater than 40. The results are ordered by count.
SELECT brand_name, COUNT(*) AS "count" FROM campusx.smartphones WHERE has_nfc = "True" AND has_ir_blaster = "True" GROUP BY brand_name ORDER BY count DESC LIMIT 1;

-- This query groups by 'has_nfc' and calculates the average price for Samsung smartphones, then orders by the availability of NFC.
SELECT has_nfc, AVG(price) AS "Avg_price" FROM campusx.smartphones WHERE brand_name = "samsung" GROUP BY has_nfc;

-- This query selects the 'model' and 'price' of the smartphone with the highest price, ordering by price in descending order, and limiting the result to the top 1 entry.
SELECT model, price FROM campusx.smartphones ORDER BY price DESC LIMIT 1;

-- This query groups by 'brand_name' and counts how many smartphones each brand has, applying a filter to include only those with a count greater than 40, ordered by count in descending order.
SELECT brand_name, COUNT(*) AS "count" FROM campusx.smartphones GROUP BY brand_name HAVING count > 40;

-- This query groups by 'brand_name' and calculates the number of smartphones, average RAM capacity, refresh rate, and fast charging availability for each brand, applying filters on refresh rate and fast charging.
SELECT brand_name, COUNT(*) AS "count", AVG(ram_capacity) AS "Avg_ram", refresh_rate, fast_charging_available FROM campusx.smartphones GROUP BY brand_name HAVING refresh_rate > 90 AND fast_charging_available = "True" AND count < 10;

-- This query groups by 'brand_name' and filters to include only those brands with a refresh rate greater than 90 and fast charging available. It calculates the average RAM and limits the result to the top 3 brands.
SELECT brand_name, AVG(ram_capacity) AS "Avg_ram" FROM campusx.smartphones WHERE refresh_rate > 90 AND fast_charging_available = 1 GROUP BY brand_name HAVING COUNT(*) < 10 ORDER BY "Avg_ram" DESC LIMIT 3;

-- This query groups by 'brand_name' and calculates the average price of smartphones that support 5G, filtering brands with more than 10 phones and an average rating above 70.
SELECT brand_name, AVG(price) AS "Avg_price" FROM campusx.smartphones WHERE has_5g = "True" GROUP BY brand_name HAVING COUNT(*) > 10 AND AVG(rating) > 70;
