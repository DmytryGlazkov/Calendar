Calendar.CalendarController = Ember.ObjectController.extend
  selectedDay: 21
  selectedMonth: 10
  selectedYear: 2013

  getDays: (->

    nowDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate())

    selectedDate = new Date(@get('selectedYear'), @get('selectedMonth') - 1, @get('selectedDay'))

    daysInMonth = 32 - new Date(@get('selectedYear'), @get('selectedMonth') - 1, 32).getDate()
    daysInPrevMonth = 32 - new Date(@get('selectedYear'), @get('selectedMonth') - 2, 32).getDate()

    startDay = new Date(@get('selectedYear'), @get('selectedMonth') - 1, 0).getDay()

    endDay = new Date(@get('selectedYear'), @get('selectedMonth'), 0).getDay()

    days = []

    day = new Object()
    day.dayClass = ''
    day.dayNum = endDay
  #  days.push(day)


    for i in [startDay - 1..0]
      day = new Object
      day.dayClass = 'anotherDay'
      day.dayNum = daysInPrevMonth - i
      days.push(day)

    for i in [1..daysInMonth]
      day = new Object
      if selectedDate == nowDate then day.dayClass = 'now'
      else day.dayClass = 'dayOfMonth'
      day.dayNum = i
      days.push(day)

    for i in [1..7 - endDay]
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
      days[35..days.length-1] if days.length > 35
    ]
  ).property('selectedDay', 'selectedMonth', 'selectedYear')