var initialize_calendar;
initialize_calendar = function() {
  // loop thru each one of the calendar classes
  $('.calendar').each(function() {
    // set calendar to this bec we're going to need to use the calendar var within the callbacks to ref back to the calendar obj once we get further along in here; easier to do this now
    var calendar = $(this)
    calendar.fullCalendar({
      // modify header
      header: {
        left: 'prev, next today',
        center: 'title',
        right: 'month, agendaWeek, agendaDay'
      },
      // enable selection of multiple days and have a callback event when this select occurs
      selectable: true,
      // show the bar as we drag along the days
      selectableHelper: true,
      // make sure counter is editable - make changes to the calendar
      editable: true,
      // if a day has more events than can be displayed on the line without making it too tall
      // eg, show 2 more events with a plus sign
      eventLimit: true,
      // pass in an events option that will fetch a json response of all of our events so if we refresh the page, our data will still be there
      // we'll pass in events.json which will reference to our index action of the events controller
      events: '/events.json', 

      // callback that happens when a select occurs, whether a date is clicked or you click and drag it out for several days to create an event
      select: function(start, end) {
        // whenever the user selects a date(s), we'll pop up a modal that they can then fill out and save it and have that create on the calendar
        // jQuery getScript will trigger the new.js.erb file
        $.getScript('/events/new', function() {
          // for daterangepicker
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });
        calendar.fullCalendar('unselect');
      }/*,
      // for dragging the selection to other dates
      eventDrop: function(event, delta, revertFunc) {
        event_data = {
          // strong params; attrs in our event model
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
          url: event.update_url,
          data: event_data,
          type: 'PATCH'
        });
      },
      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {
          $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
        });
      }*/
    });
  })
};

$(document).on('turbolinks:load', initialize_calendar);