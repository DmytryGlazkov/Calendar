Calendar.CalendarController = Ember.ObjectController.extend
  selectedDay: 4
  selectedMonth: 10
  selectedYear: 2013

  getDays: (->
    daysInMonth = 32 - new Date(@get('selectedYear'), @get('selectedMonth'), @get('selectedDay'), 32);
    daysInPrevMonth = 32 - new Date(@get('selectedYear'), @get('selectedMonth'), @get('selectedDay') - 1, 32);

    startDay = new Date(@get('selectedYear'), @get('selectedMonth'), @get('selectedDay'), 2).getDay();

    endDay = new Date(@get('selectedYear'), @get('selectedMonth'), @get('selectedDay') + 1, 2).getDay() - 1;

    days = []

    for i in [startDay - 1..0]
      day = new Object
      day.dayClass = 'anotherDay'
      day.dayNum = 31 - i
      days.push(day)

    days
  ).property('selectedDay', 'selectedMonth', 'selectedYear')