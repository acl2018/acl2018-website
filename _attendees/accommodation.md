---
title: Accommodation Information
nav_title: Accommodation
top_nav_category: Attendees
tab_index: 2
---

Accommodation has been reserved for delegates and their guests at highly competitive rates. You are encouraged to secure your accommodation through the Conference Secretariat to ensure that you receive the negotiated competitive rates. Accommodation can be booked via the [online registration form](https://icmsaust.eventsair.com/acl-2018/acl-accomodation-link) or by [contacting](mailto:acl2018@icmsaust.com.au) the Conference Secretariat.

Rates quoted are:

* Per room per night
* In Australian Dollars (AUD) and inclusive of 10% Goods and Services Tax (GST)
* Subject to availability
* Based on single or double occupancy

{% for hotel in site.data.hotels_negotiated %}
<section id="hotel-{{ hotel.name | slugify }}">
<a class="hotel-site-link" target="_blank" href="{{ hotel.link }}"><h3 class="hotel-name">{{ hotel.name }}</h3></a>
<a class="hotel-address" href="{{ hotel.map_link }}" target="_blank">{{ hotel.address }}</a>
<table class="hotel-rates">
{% for room in hotel.rooms %}
<tr>
	<td class="room-description">{{ room.description }}</td>
	<td class="room-rate">${{ room.rate }}</td>
</tr>
{% endfor %}
</table>
</section>
{% endfor %}



### Deposits 
Accommodation will not be confirmed until a deposit of one night's tariff is received by credit card or full payment by electronic funds transfer or cheque is made. This deposit will be forwarded to your hotel and will be credited to your room account. Delegates must settle the balance of their account with the hotel concerned upon check out. If accommodation deposits are not received by Friday 1 June 2018 your room will be released back to the hotel. The Conference Secretariat does not take responsibility for accommodation if deposits are not received by this date.

### Deadline for accommodation bookings
The Conference Secretariat must return all unsold rooms to the hotels/apartments on Friday 1 June 2018, therefore accommodation bookings after this date cannot be guaranteed. The rates quoted are only valid for bookings made by Friday 1 June 2018.

### Cancellations
No accommodation deposits will be refunded after Friday 1 June 2018. 
Participants who confirm an accommodation booking with a credit card and who cancel after Friday 1 June 2018 or participants, who fail to arrive on the specified date, will be charged for the entire cost of their accommodation. There will be no cancellation allowance for failure to secure a visa to Australia.

### Late bookings
Late bookings can be made through the Conference Secretariat after Friday 1 June 2018 but are subject to availability, and credit card details are required to secure the reservation.

### Early arrival
As check in is at 2pm at most hotels, your room may not be ready for immediate occupation if you arrive early. Whilst hotels will do everything possible to accommodate early arrivals, if you wish to be guaranteed immediate occupation you can pay an extra day's tariff for the night before you are due to arrive. If you wish to take this precaution, please advise the Conference Secretariat on the registration form so that we can notify the hotel.

### Late arrival
Please indicate if you will arrive at your hotel after 6pm on the day of check in. Failure to do so might result in your booking being cancelled and your room given to someone else.

### Change of booking
Any change in booking must be made in writing to the Conference Secretariat and not directly to the hotel. Please note charges may apply after Friday 1 June 2018.

### Enquiries

Please direct all accommodation enquiries to ACL 2018 Conference Secretariat

* Phone: [+61 2 9254 5000](tel:+61-2-9254-5000)
* Email: [acl2018@icmsaust.com.au](mailto:acl2018@icmsaust.com.au)
