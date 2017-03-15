# An Online Booking System

This platform emulates an online booking system that allows school teachers to book for enrichment programs offered by informal learning institutions like museums or private educational vendors.

## Staus

Ongoing. A demo of the current progress is [here](https://online-booking-system.herokuapp.com).

## Built with

[Ruby on Rails](http://rubyonrails.org/)

## Features

### Done

* Separate controller and views for admin to manage resources
* Filters (search, by category, by year) according to customers' areas of interest
* Use devise to handle registrations and sessions but within the admin scope
* Admins and managers (who are school admins) who can create and delete teacher accounts, can view programs
* Managers can perform CRUD on own users
* Regulars (most probably teachers) can view programs

### Todo

* Calendar view for programs' available dates
* Admins can make bookings, can view and create programs/users but should only be able to update and destroy their own programs
* Managers can make bookings; account registration with credit card info available only to managers
* Teachers can make bookings
* Tests. Eg, a bug can cause the system to accept a booking although the slot is taken
* Rating system and accept feedback from teachers only for those programs they booked
* Favourites by following the lesson. This will allow the teachers to easily book the program for his/her next batch of students
* See what their fellow teachers from another school are following
* Information to the teacher following the lesson if the lesson is removed by the admin
* Availability of programs are dependent on the availability of staff and laboratories
* Suitability of laboratories for different programs
* Each staff has different competencies relative to another eventhough they belong to the same department
* Provide summary of weekly bookings which staff can export to a table and print
* Provide a separate view for staff to see bookings assigned
