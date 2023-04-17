-- 1.Write a query to display for each store its store ID, city, and country.
select s.store_id, c.city, co.country from store s
join address a
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country co
on c.country_id = co.country_id;
-- 2.Write a query to display how much business, in dollars, each store brought in.
select store_id, sum(amount) as revenue from staff as s
join payment p
on s.staff_id = p.staff_id
group by store_id;
-- 3.Which film categories are longest?
select name, concat('$', avg(length)) as "average lenght" 
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
group by name
order by avg(length) desc;
-- 4.Display the most frequently rented movies in descending order.
select title, count(rental_id) as 'rental-frequency'
from rental r
join inventory i
on r.inventory_id = i.inventory_id
join film f
on i.film_id = f.film_id
group by title
order by count(rental_id) desc;
-- 5.List the top five genres in gross revenue in descending order.
select name as 'Genre', concat('$', sum(amount)) "Gross revenuw" from
category c
join film_category fc
on c.category_id = fc.category_id
join inventory i
on fc.film_id = i.film_id
join rental r
on i.inventory_id = r.inventory_id
join payment p
on r.rental_id = p.rental_id
group by name
order by sum(amount) desc;
-- 6.Is "Academy Dinosaur" available for rent from Store 1? YES IT IS
select distinct store_id, title from film f
join inventory i
on f.film_id = i.film_id
where title = "Academy Dinosaur";
-- 7.Get all pairs of actors that worked together.
SELECT CONCAT(a1.first_name, ' ', a1.last_name) AS actor1,
       CONCAT(a2.first_name, ' ', a2.last_name) AS actor2
FROM film_actor fa1
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
JOIN actor a1 ON fa1.actor_id = a1.actor_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id;