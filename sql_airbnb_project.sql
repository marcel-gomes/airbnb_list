/* Identify High-Demand Room Types: Retrieve the room types that have the highest average number of reviews, indicating high demand among guests. */

SELECT room_type, COUNT(*) AS total_listings
FROM Airbnb_room_type
GROUP BY room_type
ORDER BY total_listings DESC;

/* Average Price by Neighborhood: Calculate the average price of Airbnb listings in each neighborhood, providing insights into pricing variations across locations. */

SELECT nbhood_full, AVG(price) AS avg_price
FROM Airbnb_price
GROUP BY nbhood_full
ORDER BY avg_price DESC;

/* Impact of Last Review on Price: Analyze how the recency of the last review correlates with listing prices to understand the importance of reviews on pricing. */

SELECT 
  last_review_mons,
  COUNT(*) AS total_listings
FROM Airbnb_last_review
GROUP BY last_review_mons
ORDER BY last_review_mons;

/* Listings with Frequent Price Changes: Identify listings with a history of frequent price changes by comparing the standard deviation of prices. */

SELECT room_type, AVG(price) AS avg_price
FROM Airbnb_room_type
INNER JOIN Airbnb_price ON Airbnb_room_type.Listing_id = Airbnb_price.Listing_id
GROUP BY room_type
ORDER BY avg_price DESC;

/* Host Behavior Analysis: Determine the percentage of listings in which hosts provide the entire home, as this can indicate the impact on housing availability. */

SELECT 
  host_name,
  COUNT(*) AS total_listings
FROM Airbnb_last_review
GROUP BY host_name
ORDER BY total_listings DESC
LIMIT 10;