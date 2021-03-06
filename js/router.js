// Generated by CoffeeScript 1.6.3
(function() {
  Calendar.Router.map(function() {
    return this.resource('Calendar', {
      path: '/'
    }, function() {
      return this.resource('year', {
        path: '/year/:selectedYear'
      }, function() {
        return this.resource('month', {
          path: '/month/:selectedMonth'
        }, function() {
          return this.resource('date', {
            path: '/date/:selectedDate'
          });
        });
      });
    });
  });

  Calendar.CalendarRoute = Ember.Route.extend();

  Calendar.CalendarIndexRoute = Ember.Route.extend({
    model: function() {
      return null;
    },
    enter: function() {
      return this.transitionTo('date');
    }
  });

  Calendar.YearRoute = Ember.Route.extend({
    model: function(params) {
      return params;
    }
  });

  Calendar.MonthRoute = Ember.Route.extend({
    model: function(params) {
      return params;
    }
  });

  Calendar.DateRoute = Ember.Route.extend({
    model: function(params) {
      return {
        selectedDay: params.selectedDate,
        selectedMonth: this.modelFor('month').selectedMonth,
        selectedYear: this.modelFor('year').selectedYear
      };
    },
    renderTemplate: function(controller) {
      return this.render('date', {
        controller: controller
      });
    }
  });

}).call(this);
