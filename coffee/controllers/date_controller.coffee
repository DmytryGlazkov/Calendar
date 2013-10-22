Calendar.DateController = Ember.ObjectController.extend
  currentDay: new Date().getDate()
  currentMonth: new Date().getMonth() + 1
  currentYear: new Date().getFullYear()

  getDays: (->
    console.log @get('currentDay') + '/' + @get 'currentMonth' + '/' + @get 'currentYear'

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

      @checkDate(selectedDate, new Date(@get('currentYear'), @get('currentMonth') - 2, daysInPrevMonth - i), day, 'anotherDay')

      day.dayNum = daysInPrevMonth - i
      days.push(day)


    for i in [1..daysInMonth]
      day = new Object

      @checkDate(selectedDate, new Date(@get('currentYear'), @get('currentMonth') - 1, i), day, 'dayInMonth')

      day.dayNum = i
      days.push(day)


    for i in [1..7 - endDay]
      day = new Object

      @checkDate(selectedDate, new Date(@get('currentYear'), @get('currentMonth'), i), day, 'anotherDay')

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

  checkDate: (selected, current, day, defaultClass) ->
    now = new Date()
    nowDate = new Date(now.getFullYear(), now.getMonth(), now.getDate())
    if current.getTime() == nowDate.getTime()
    then day.dayClass = 'now'
    else
      if current.getTime() == selected.getTime()
      then day.dayClass = 'selected'
      else
        day.dayClass = defaultClass