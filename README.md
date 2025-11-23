# 🎵 Spotify SQL Analysis Project  
### PostgreSQL • pgAdmin • Data Cleaning • Analytics • Index Optimization

This project explores Spotify track and artist data using SQL in PostgreSQL (pgAdmin).  
It includes data cleaning, exploratory queries, analytical insights, and performance optimization using indexes.

---

## 📌 Project Overview
The goal of this project is to analyze Spotify music trends such as:
- Most streamed tracks  
- Top artists  
- Album-level statistics  
- Danceability & energy metrics  
- Platform-wise streaming comparison  
- YouTube vs Spotify dominance  
- Window function ranking  
- Query performance improvement using indexing  

---



---

## 🧹 Data Cleaning Queries

### ✔ Count distinct artists & albums
```sql
SELECT COUNT(DISTINCT artist) FROM Spotify;
SELECT COUNT(DISTINCT album) FROM Spotify;
SELECT DISTINCT album_type FROM Spotify;
```
# ❓ List of Analysis Questions Used in the Project

Below is a clean list of **all analytical questions** that were answered using SQL:

1. **Retrieve the names of all tracks with more than 1 billion streams.**  
2. **List all albums along with their respective artists.**  
3. **Get the total number of comments for tracks whose license is TRUE.**  
4. **Find all tracks that belong to the album type "Single".**  
5. **Count the total number of tracks by each artist.**  
6. **Calculate the average danceability of tracks in each album.**  
7. **Find the top five tracks with the highest energy values.**  
8. **List all tracks with total views and likes where the official video is TRUE.**  
9. **Calculate the total views of tracks for each album.**  
10. **Retrieve tracks that have more streams on Spotify than on YouTube.**  
11. **Find the top three most viewed tracks for each artist using window functions.**  
12. **List tracks where the liveness score is above average.**  
13. **Compute the difference between highest and lowest energy for each album.**  

---

# 🧹 Data Cleaning Highlights

- Removed records with **zero duration**  
- Counted unique **artists** and **albums**  
- Inspected distinct values for `album_type`, `channel`, and `most_played_on`  

---

# 📊 Key Analysis Insights

- Several songs exceeded **1B+ streams**  
- Artists with the highest number of tracks were identified  
- Energy and danceability varied widely across albums  
- Spotify often outperformed YouTube for many tracks  
- Window functions were used to rank top tracks per artist  

---

# 🚀 Query Optimization & Performance Improvement

To improve query performance for artist-based filtering and sorting, an index was created on the `artist` column.
The EXPLAIN ANALYZE output clearly showed a sequential scan, meaning PostgreSQL scanned the entire table to filter rows for the artist "Gorillaz".

### 🔧 **Query Used for Benchmarking**
```sql
SELECT 
    artist,
    track,
    views
FROM spotify
WHERE artist = 'Gorillaz'
  AND most_played_on = 'Youtube'
ORDER BY stream DESC
LIMIT 25;
```
## ⏱️ Before Index-Optimisation
Planning Time: 0.106 ms  
Execution Time: 2.854 ms

## ⚡ After Index-Optimisation
Planning Time: 0.097 ms  
Execution Time: 0.076 ms

EXPLAIN ANALYZE helped demonstrate a 97% reduction in execution time after indexing.

### **📸 Screenshot 1 — Data Preview**
![Screenshot 1](images/Sc1.png)

---

### **📸 Screenshot 2 — Query Execution Output**
![Screenshot 2](images/Sc2.png)

---

### **📸 Screenshot 3 — ER Diagram (Placeholder)**
![Screenshot 3](images/Sc3.png)

