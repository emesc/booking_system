$(document).on "turbolinks:load", -> 
  $("input#booking_preferred_date").datepicker({
    dateFormat: "dd-mm-yy"
  });