var initialise_calendar;
initialise_calendar = function() {
  // loop thru each one of the calendar classes
  $('.calendar').each(function() {
    // set calendar var to $this bec we're going to need to use the calendar var within the callbacks to ref back to the calendar obj once we get further along in here; easier to do this now
    var calendar = $(this);
    // call fullCalendar on the current calendar obj
    calendar.fullCalendar({
      // modify header
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month, agendaWeek, agendaDay'
      }
    });
  });
};

$(document).on('turbolinks:load', initialise_calendar);