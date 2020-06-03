-- ---------------Joins---------------
-- ----------1----------
select * from invoice i
join invoice_line il on il.invoice_id = i.invoice_id
where il.unit_price > 0.99;

-- ----------2----------
select i.invoice_date, c.first_name, c.last_name, i.total 
from invoice i
join customer c on c.customer_id = i.customer_id;

-- ----------3----------
select c.first_name, c.last_name, e.first_name, e.last_name from customer c
join employee e on e.employee_id = c.support_rep_id;

-- ----------4----------
select al.title, ar.name from album al
join artist ar on al.artist_id = ar.artist_id;

-- ----------5----------
select pt.track_id from playlist_track pt
join playlist p on pt.playlist_id = p.playlist_id
where p.name = 'Music';

-- ----------6----------
select t.name from track t
join playlist_track pt on t.track_id = pt.track_id
where pt.playlist_id = 5;

-- ----------7----------
select t.name, p.name
from track t join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;

-- ----------8----------
select t.name, a.title from track t
join album a on t.album_id = a.album_id
join genre g on t.genre_id = g.genre_id
where g.name = 'Alternative & Punk'; 

-- ----------BD----------
select t.name, g.name, al.title, ar.name, from track t
join genre g on t.genre_id = g.genre_id
join album al on t.album_id = al.album_id
join artist ar on al.artist_id = ar.artist_id
join playlist_track pt on t.track_id = pt.track_id
join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'Music';

-- ---------------Nested Queries---------------
-- ----------1----------
select * from invoice
where invoice_id in (
  select invoice_id from invoice_line
  where unit_price > 0.99);

-- ----------2----------
select * from playlist_track
where playlist_id in(
  select playlist_id from playlist
  where name = 'Music');

-- ----------3----------
select name from track
where track_id in (
  select track_id from playlist_track
  where playlist_id = 5);

-- ----------4----------
select * from track
where genre_id in (
  select genre_id from genre
  where name = 'Comedy');

-- ----------5----------
select * from track
where album_id in (
  select album_id from album
  where name = 'Fireball');

-- ----------6----------
select * from track
where album_id in (
  select album_id from album
  where artist_id in (
    select artist_id from artist
    where name = 'Queen'));

-- ---------------Updating Rows---------------
-- ----------1----------
Update customer
set fax = null
where fax is not null;

-- ----------2----------
update customer
set company = 'Self'
where company is null;

-- ----------3----------
update customer
set last_name = 'Thompson'
where first_name = 'Julia' and last_name = 'Barnett';

-- ----------4----------
update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

-- ----------5----------
update track
set composer = 'The Darkness around us'
where genre_id in (
  select genre_id from genre
  where name = 'Metal')
  and composer is null;

-- ----------6----------
-- Refreshed

-- ---------------Group by---------------
-- ----------1----------
select count(*), g.name from track t
join genre g on t.genre_id = g.genre_id
group by g.name;

-- ----------2----------
select count(*), g.name from track t
join genre g on t.genre_id = g.genre_id
where g.name = 'Pop' or g.name = 'Rock'
group by g.name;

-- ----------3----------
select count(*), ar.name from artist ar
join album al on al.artist_id = ar.artist_id
group by ar.name;

-- ---------------Use Distinct---------------
-- ----------1----------
select distinct composer from track;

-- ----------2----------
select distinct billing_postal_code
from invoice;

-- ----------3----------
select distinct company
from customer;

-- ---------------Delete Rows---------------
-- ----------1----------
-- Complete

-- ----------2----------
delete from practice_delete where type = 'bronze';

-- ----------3----------
delete from practice_delete where type = 'silver';

-- ----------4----------
delete from practice_delete where value = 150;

-- ---------------eCommerce Simulation---------------
-- ----------1----------

-- ----------2----------
-- ----------3----------
-- ----------4----------
-- ----------5----------
-- ----------6----------
-- ----------7----------
-- ----------8----------
-- ----------9----------
-- ----------10----------
-- ----------11----------
-- ----------12----------
-- ----------13----------
-- ----------14----------
-- ----------15----------
-- ----------16----------
-- ----------17----------
-- ----------18----------
-- ----------19----------
-- ----------20----------