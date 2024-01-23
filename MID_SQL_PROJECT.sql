/*We will need a list of all staff members,including their First and Last names,
email addresses,and then identification number where they work.*/
SELECT first_name,
       last_name,
       email,
       store_id
FROM staff;    

/*We will need separate counts of inventory items held at each of your two stores.*/
SELECT  store_id,
        COUNT(inventory_id) AS Inventory_item_for_eachstore 
FROM inventory
GROUP BY store_id;  

/* We will need a count of active customers for each of your stores,separately. */ 
SELECT COUNT(customer_id) AS Total_customer_for_eachStore,
       store_id
 FROM customer
 WHERE active =1
 Group BY store_id;
 
/*we will need you to provide a count of all customer email addresses stored in the database.*/

SELECT COUNT(email) AS Total_email
FROM customer;

/* provide a count of unique film titles you have in inventory at each store and then provide a 
count of the unique categories of films you provide*/ 
 SELECT 
	    store_id,
        COUNT(DISTINCT film_id) AS Unique_Film
 FROM inventory
 GROUP BY store_id;
 
 /* provide a count of the unique categories of films you provide */
 
 SELECT 
      COUNT(DISTINCT name) AS UNIQUE_categories
      FROM category;
      
/* provide the replacement cost for the film that is least expensive to replace,the most expensive 
to replace and the average 
of all films you carry. */ 
SELECT MIN(replacement_cost) AS least_expensive,
       MAX(replacement_cost) AS most_expensive,
       AVG(replacement_cost) AS average_replacement_cost
 FROM film; 
 
 /* provide the average payment you process,as well as the maximum payment you have processed. */
     SELECT AVG(amount) AS Avg_amnt,
            MAX(amount) AS Max_amnt
      FROM payment;  
      
  /* We would like to better understand what your customer base looks like.Please provide a
  list of all customer identification values,with a count of rentals they have made
  all-time,with your highest
  volume customers at the top of the list. */  
  SELECT customer_id,
   COUNT(rental_id) AS num_of_rentals
  FROM rental
  GROUP BY customer_id
  ORDER BY 
        COUNT(rental_id) DESC;