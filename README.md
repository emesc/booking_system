# An Online Booking System

This platform emulates an online booking system that allows school teachers to book for enrichment programs offered by informal learning institutions like museums or private educational vendors.

## Status

Ongoing. A demo of the current progress is [here](https://online-booking-system.herokuapp.com).

## Built with

[Ruby on Rails](http://rubyonrails.org/)

## Features

### Done

* Separate controller and views for admin to manage resources
* Filters (search, by category, by year) according to customers' areas of interest
* Use devise to handle registrations and sessions but within the admin scope
* Admins can perform CRUD on all resources
* Managers (school admins) can perform CRUD on own users (Regulars)
* Regulars (most probably teachers) can only view programs

### Ongoing
* Tests

### What's next
* Calendar view for programs' available dates
* Admins can make bookings
* Managers can make bookings; account registration with credit card info available only to managers
* Teachers can make bookings
* Rating system and accept feedback from teachers only for those programs they booked
* Favourites by following the lesson. This will allow the teachers to easily book the program for his/her next batch of students
* See what their fellow teachers from another school are following
