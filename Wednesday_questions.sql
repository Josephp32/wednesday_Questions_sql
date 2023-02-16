--1#
select first_name,last_name, customer_id 
from customer 
full join address
on address.address_id = customer.address_id and address.district = 'Texas';

--2#
select first_name, last_name, payment.amount 
from customer 
inner join payment
on payment.customer_id = customer.customer_id and payment.amount > 6.99;

--3#
select first_name, last_name, customer_id 
from customer 
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having max(amount) > 175
);

--4#
select customer.first_name, customer.last_name, customer.email, country
from customer 
full join address 
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id
where country = 'Nepal'

--5#
select count(payment_id), staff.first_name, staff.last_name
from staff
inner join payment														
on staff.staff_id = payment.staff_id
group by staff.staff_id;

--6#
select rating, count(film_id) 
from film
group by rating 
order by count(film_id) desc;

--7#
select customer_id, first_name, last_name 
from customer 
where customer_id in (
	select customer_id
	from payment     					
	where amount > 6.99
	group by payment.payment_id
	order by customer_id
);

--8#
select count(rental_id)
from rental
where rental_id in(					
select rental.rental_id
from rental
full join payment
on payment.payment_id = rental.rental_id 
where payment.rental_id is null
);


select count(rental_id)
from payment
where rental_id in (
	select rental_id 
	from rental
	where amount is null
);






