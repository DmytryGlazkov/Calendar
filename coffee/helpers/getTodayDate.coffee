Ember.Handlebars.registerHelper('todayDate', (part, substitute) ->
  return new Date().toLocaleDateString()
)