select first_name, last_name, levels from employee
order by levels desc
limit 1

select * from invoice

select count(total) as billing_count, billing_country from invoice 
group by billing_country
order by billing_count desc

select total as top_3_invoice from invoice
order by total desc 
limit 3


select billing_city , sum(total) as invoice_total, sum(i.total) from invoice 
group by billing_city
order by invoice_total desc

select customer.first_name, customer.last_name , customer.customer_id , sum(invoice.total) as total_sum
from customer
inner join invoice
on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total_sum desc
limit 1


select distinct first_name , last_name, email
from customer
inner join invoice on customer.customer_id = invoice.customer_id
inner join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
           select track_id from track 
	       inner join genre on track.genre_id = genre.genre_id
	       where genre.name like 'Rock'
)
order by email


select artist.artist_id, artist.name, count(artist.artist_id) as number_of_song
from track
inner join album on album.album_id= track.album_id
inner join artist on album.artist_id= artist.artist_id
inner join genre on track.genre_id= genre.genre_id
where genre.name= 'Rock'
group by artist.artist_id
order by number_of_song desc
limit 10


select name, milliseconds
from track 
where milliseconds > (
             select avg(milliseconds) as avg_tack_length
	         from track  
)
order by milliseconds desc



with best_selling_artist as (
             
)