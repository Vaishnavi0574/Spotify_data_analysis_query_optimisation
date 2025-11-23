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

## 🖼️ Screenshots (Dummy Images)

### **📸 Screenshot 1 — Data Preview**
![Screenshot 1](images/Sc1.png)

---

### **📸 Screenshot 2 — Query Execution Output**
![Screenshot 2](images/Sc2.png)

---

### **📸 Screenshot 3 — ER Diagram (Placeholder)**
![Screenshot 3](images/Sc3.png)

---

## 🧹 Data Cleaning Queries

### ✔ Count distinct artists & albums
```sql
SELECT COUNT(DISTINCT artist) FROM Spotify;
SELECT COUNT(DISTINCT album) FROM Spotify;
SELECT DISTINCT album_type FROM Spotify;
