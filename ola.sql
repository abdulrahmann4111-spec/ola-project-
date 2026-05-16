create Database ola;
use ola;
create view Successful_Bookings As
select * from bookings
where Booking_Status = 'success';

select * from Successful_Bookings;

create view ride_distance_for_each_vehicle as
select Vehicle_Type, AVG(Ride_Distance)
as avg_distance From bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

create view canceled_rides_by_customers as
select count(*) From bookings
where Booking_Status = 'Canceled by customer';

select * from canceled_rides_by_customers;

create view top_5_customer as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;

select * from top_5_customer;

create view canceled_by_drivers as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from canceled_by_drivers;

create view max_min_driver_rating as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

select * from max_min_driver_rating;

create view upi_payment as
select * from bookings 
where Payment_Method = 'UPI';

select * from upi_payment;

create view AVG_Customer_Rating as
select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

select * from AVG_Customer_Rating;

create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_value
from bookings
where Booking_Status = 'Success';

select * from total_successful_ride_value;

create view incomplete_rides_reason as
select Booking_ID, Incomplete_Rides_Reason
From bookings
where Incomplete_Rides = 'Yes';

select * from incomplete_rides_reason;