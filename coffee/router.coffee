Calendar.Router.map ->
  @resource('Calendar', {path: '/'}, ->
    @resource('year', path:'/year/:selectedYear', ->
      @resource('month', path:'/month/:selectedMonth', ->
        @resource('date', path:'/date/:selectedDate')
      )
    )
  )

Calendar.CalendarRoute = Ember.Route.extend()

Calendar.CalendarIndexRoute = Ember.Route.extend
  model: ->
    null
  enter: ->
    @transitionTo('date')

Calendar.YearRoute = Ember.Route.extend
  model: (params) ->
    return params

Calendar.MonthRoute = Ember.Route.extend
  model: (params) ->
    return params

Calendar.DateRoute = Ember.Route.extend
  model: (params) ->
    selectedDay: params.selectedDate
    selectedMonth: @modelFor('month').selectedMonth
    selectedYear: @modelFor('year').selectedYear

  renderTemplate: (controller) ->
    @render('date', {controller:controller})