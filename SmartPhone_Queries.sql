-- Selects model, price, rating, and renames os as "Operating System" and battery_capacity as "Mah"
SELECT model, price, rating, os AS "Operating System", battery_capacity AS "Mah" 
FROM campusx.smartphones;

-- Calculates the pixel density (PPI) by using the Pythagorean theorem to get the diagonal resolution
-- and dividing it by the screen size
SELECT model, SQRT(resolution_width * resolution_width + resolution_height * resolution_height) / screen_size AS "ppi" 
FROM campusx.smartphones;

-- Selects model and adds a static column "type" with the value "smartphone" for every row
SELECT model, "smartphone" AS "type" 
FROM campusx.smartphones;

-- Selects all distinct (unique) brand names from the smartphones table
SELECT DISTINCT(brand_name) AS "all brand" 
FROM campusx.smartphones;

-- Selects all distinct (unique) processor brands from the smartphones table
SELECT DISTINCT(processor_brand) AS "all_processor" 
FROM campusx.smartphones;

-- Selects all unique combinations of brand_name and processor_brand
SELECT DISTINCT brand_name, processor_brand  
FROM campusx.smartphones;

-- Selects all smartphones where the brand name is "Oppo"
SELECT * 
FROM campusx.smartphones 
WHERE brand_name = "oppo";

-- Selects all smartphones where the price is greater than 100,000
SELECT * 
FROM campusx.smartphones 
WHERE price > 100000;

-- Selects all smartphones where the price is between 100,000 and 150,000 and orders by brand_name
SELECT * 
FROM campusx.smartphones 
WHERE price > 100000 AND price < 150000 
ORDER BY brand_name;

-- Selects smartphones with a price below 15,000, rating above 80, and using a "Snapdragon" processor
SELECT * 
FROM campusx.smartphones 
WHERE price < 15000 AND rating > 80 AND processor_brand = "snapdragon";

-- Selects all Samsung smartphones with RAM greater than 10 GB
SELECT * 
FROM campusx.smartphones 
WHERE brand_name = "samsung" AND ram_capacity > 10;

-- Selects all smartphones with RAM greater than 16 GB
SELECT * 
FROM campusx.smartphones 
WHERE ram_capacity > 16;

-- Selects distinct brand names for smartphones with a price below 200,000
SELECT DISTINCT(brand_name) 
FROM campusx.smartphones 
WHERE price < 200000;

-- Selects all smartphones with processors from either "Snapdragon", "Exynos", or "Bionic"
SELECT * 
FROM campusx.smartphones 
WHERE processor_brand = "snapdragon" OR processor_brand = "exynos" OR processor_brand = "bionic";

-- Selects all smartphones where the processor is not from "Snapdragon", "Exynos", or "Bionic"
SELECT * 
FROM campusx.smartphones 
WHERE processor_brand NOT IN ("snapdragon", "exynos", "bionic");

-- Selects all smartphones where the processor is from "Snapdragon", "Exynos", or "Bionic"
SELECT * 
FROM campusx.smartphones 
WHERE processor_brand IN ("snapdragon", "exynos", "bionic");

-- Selects all smartphones where the processor brand is "MediaTek"
SELECT * 
FROM campusx.smartphones 
WHERE processor_brand = "mediatek";

-- Updates the processor brand from "MediaTek" to "Dimensity" for all matching records
UPDATE campusx.smartphones 
SET processor_brand = "dimensity" 
WHERE processor_brand = "mediatek";

-- Deletes all smartphones where the price is greater than 200,000
DELETE FROM campusx.smartphones 
WHERE price > 200000;

-- Selects all smartphones where the price is less than 200,000
SELECT * 
FROM campusx.smartphones 
WHERE price < 200000;

-- Selects the maximum RAM capacity among all smartphones
SELECT MAX(ram_capacity) 
FROM campusx.smartphones;

-- Selects the minimum RAM capacity among all smartphones
SELECT MIN(ram_capacity) 
FROM campusx.smartphones;

-- Selects the maximum price of Samsung smartphones
SELECT MAX(price) 
FROM campusx.smartphones 
WHERE brand_name = "samsung";

-- Selects all Samsung smartphones where the price is exactly 163,980
SELECT * 
FROM campusx.smartphones 
WHERE brand_name = "samsung" AND price = "163980";

-- Selects the average price of all smartphones
SELECT AVG(price) 
FROM campusx.smartphones;

-- Selects the average price and average rating for all "Lava" brand smartphones
SELECT AVG(price), AVG(rating) 
FROM campusx.smartphones 
WHERE brand_name = "lava";

-- Selects the sum of the prices of all smartphones
SELECT SUM(price) 
FROM campusx.smartphones;

-- Counts the number of smartphones with the brand name "OnePlus"
SELECT COUNT(*) 
FROM campusx.smartphones 
WHERE brand_name = "oneplus";

-- Counts the number of distinct (unique) brand names
SELECT COUNT(DISTINCT(brand_name)) 
FROM campusx.smartphones;

-- Selects the standard deviation of the screen size across all smartphones
SELECT STD(screen_size) 
FROM campusx.smartphones;

-- Selects the variance of the screen size across all smartphones
SELECT VARIANCE(screen_size) 
FROM campusx.smartphones;





