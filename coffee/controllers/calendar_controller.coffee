Calendar.CalendarController = Ember.ObjectController.extend
  selectedDay: 4
  selectedMonth: 11
  selectedYear: 2013

  getDays: (->
    daysInMonth = 32 - new Date(@get('selectedYear'), @get('selectedMonth'), 32).getDate()
    daysInPrevMonth = 32 - new Date(@get('selectedYear'), @get('selectedMonth') - 1, 32).getDate()

    startDay = new Date(@get('selectedYear'), @get('selectedMonth'), 2).getDay()

    endDay = new Date(@get('selectedYear'), @get('selectedMonth') + 1, 1).getDay()

    days = []

    for i in [startDay - 1..0]
      day = new Object
      day.dayClass = 'anotherDay'
      day.dayNum = daysInPrevMonth - i
      days.push(day)

    for i in [1..daysInMonth]
      day = new Object
      day.dayClass = 'dayOfMonth'
      day.dayNum = i
      days.push(day)

    for i in [1..6 - endDay]
      day = new Object
      day.dayClass = 'anotherDay'
      day.dayNum = i
      days.push(day)

    [
      days[0..6]
      days[7..13]
      days[14..20]
      days[21..27]
      days[28..34]
    ]
  ).property('selectedDay', 'selectedMonth', 'selectedYear')