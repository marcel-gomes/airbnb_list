# airbnb_list
🏠 Airbnb List Review Project 🏨

📚 Introduction

Welcome to the Airbnb List Review Database Project, a comprehensive exploration of Airbnb's impact on housing markets using data analytics and SQL. 🏡

In this project, we will delve into a dataset that focuses on Airbnb listings, particularly emphasizing the last review date, pricing, and room types. Through a series of SQL queries and analyses, we aim to gain valuable insights into how Airbnb listings affect housing markets in various locations. 📊

Our dataset consists of crucial information that allows us to address questions related to Airbnb's role in housing markets, local regulations, host behavior, and much more. Join us on this data-driven journey as we uncover the nuances of Airbnb's impact on cities and the legislative considerations it raises. 🌆

🎯 Objective

Implement SQL querying techniques to explore and analyze the data.
Leverage SQL to gain insights into Airbnb's role in housing markets.
Understand how Airbnb listings, pricing, and room types influence various aspects of housing markets.
🔧 Tools

SQL (Structured Query Language)
🏡 Airbnb List Review Dataset

This project focuses on a subset of the Airbnb dataset, concentrating on the following key aspects:

Last_review – Represents the date of the last review for each Airbnb listing.
Price – Indicates the pricing information for Airbnb listings.
Room_type – Categorizes Airbnb listings into different room types (e.g., entire home, private room, shared room).
📝 Dataset Source

The dataset used in this project is sourced from publicly available Airbnb information. It has been meticulously cleaned, aggregated, and prepared for analysis and discussion. The dataset provides valuable insights into Airbnb's influence on housing markets and serves as a resource for addressing relevant legislation and debates. 🏨

📃 Queries

Identify High-Demand Room Types: Retrieve the room types that have the highest average number of reviews, indicating high demand among guests.
sql
Copy code
SELECT room_type, AVG(number_of_reviews) AS avg_reviews
FROM airbnb_listings
GROUP BY room_type
ORDER BY avg_reviews DESC
LIMIT 5;
Average Price by Neighborhood: Calculate the average price of Airbnb listings in each neighborhood, providing insights into pricing variations across locations.
sql
Copy code
SELECT neighborhood, AVG(price) AS avg_price
FROM airbnb_listings
GROUP BY neighborhood
ORDER BY avg_price DESC;
Impact of Last Review on Price: Analyze how the recency of the last review correlates with listing prices to understand the importance of reviews on pricing.
sql
Copy code
SELECT 
  CASE
    WHEN last_review >= '2023-01-01' THEN 'Recent'
    WHEN last_review < '2023-01-01' THEN 'Not Recent'
  END AS review_status,
  AVG(price) AS avg_price
FROM airbnb_listings
GROUP BY review_status;
Listings with Frequent Price Changes: Identify listings with a history of frequent price changes by comparing the standard deviation of prices.
sql
Copy code
SELECT listing_id, COUNT(*) AS price_changes
FROM airbnb_price_history
GROUP BY listing_id
HAVING COUNT(*) > 5
ORDER BY price_changes DESC
LIMIT 10;
Host Behavior Analysis: Determine the percentage of listings in which hosts provide the entire home, as this can indicate the impact on housing availability.
sql
Copy code
SELECT 
  SUM(CASE WHEN room_type = 'Entire home/apt' THEN 1 ELSE 0 END) AS entire_home_listings,
  COUNT(*) AS total_listings,
  (SUM(CASE WHEN room_type = 'Entire home/apt' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_entire_home
FROM airbnb_listings;
In this project, we will explore these queries and more to gain a deeper understanding of Airbnb's influence on housing markets and its relevance to legislation. Through data analysis and SQL techniques, we aim to shed light on important aspects of the Airbnb ecosystem. 🏠📈
