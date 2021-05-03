use sakila;

# 1) Use the RANK() and the table of your choice rank films by length 
# (filter out the rows that have nulls or 0s in length column). 
# In your output, only select the columns title, length, and the rank.

SELECT title, length, RANK() OVER (ORDER BY length) ranks
FROM sakila.film
WHERE length is not null and length > 0;

# 2) Build on top of the previous query and rank films by length within the rating category 
# (filter out the rows that have nulls or 0s in length column). 
# In your output, only select the columns title, length, rating and the rank.

SELECT title, length, rating, RANK() OVER (partition by rating order by length desc) as ranks
FROM sakila.film
WHERE length is null and length = 0;

# 3) How many films are there for each of the categories?
# Inspect the database structure and use appropriate join to write this query.

SELECT name as category_name, count(*) as num_films
FROM sakila.category INNER JOIN sakila.film_category using (category_id)
GROUP BY NAME
ORDER BY num_films desc;

# 4) Which actor has appeared in the most films?

SELECT actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as film_count
FROM sakila.actor JOIN sakila.film_actor using (actor_id)
GROUP BY actor_id
ORDER BY film_count desc
LIMIT 1;  

# 5) Most active customer (the customer that has rented the most number of films)

SELECT customer.*, count(rental_id) as rental_count
FROM sakila.customer JOIN sakila.rental using (customer_id)
GROUP BY customer_id
ORDER BY rental_count desc
LIMIT 1;


 







