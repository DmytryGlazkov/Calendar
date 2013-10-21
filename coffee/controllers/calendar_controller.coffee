Calendar.CalendarController = Ember.ObjectController.extend
  selectedDay: 22
  selectedMonth: 10
  selectedYear: 2013

  currentDay: 21
  currentMonth: 10
  currentYear: 2013
  
  getDays: (->

    nowDate = new Date()

    currentDate = new Date(@get('currentYear'), @get('currentMonth') - 1, @get('currentDay'))

    selectedDate = new Date(@get('selectedYear'), @get('selectedMonth') - 1, @get('selectedDay'))

    daysInMonth = 32 - new Date(@get('currentYear'), @get('currentMonth') - 1, 32).getDate()
    daysInPrevMonth = 32 - new Date(@get('currentYear'), @get('currentMonth') - 2, 32).getDate()

    startDay = new Date(@get('currentYear'), @get('currentMonth') - 1, 0).getDay()

    endDay = new Date(@get('currentYear'), @get('currentMonth'), 0).getDay()

    days = []

    for i in [startDay - 1..0]
      day = new Object

      if new Date(@get('currentYear'), @get('currentMonth') - 2, daysInPrevMonth - i).getDate() == nowDate.getDate()
      then day.dayClass = 'now'
      else day.dayClass = 'anotherDay'

      day.dayNum = daysInPrevMonth - i
      days.push(day)


    for i in [1..daysInMonth]
      day = new Object

      if new Date(@get('currentYear'), @get('currentMonth') - 1, i).getDate() == nowDate.getDate()
      then day.dayClass = 'now'
      else
        if new Date(@get('selectedYear'), @get('selectedMonth') - 1, i).getDate() == selectedDate.getDate()
        then day.dayClass = 'selected'
        else
          day.dayClass = 'dayOfMonth'

      day.dayNum = i
      days.push(day)


    for i in [1..7 - endDay]
      day = new Object

      if new Date(@get('currentYear'), @get('currentMonth'), i).getDate() == nowDate.getDate()
      then day.dayClass = 'now'
      else day.dayClass = 'anotherDay'

      day.dayNum = i
      days.push(day)

    [
      days[0..6]
      days[7..13]
      days[14..20]
      days[21..27]
      days[28..34]
      days[35..days.length-1] if days.length > 35
    ]

  ).property('currentDay', 'currentMonth', 'currentYear')