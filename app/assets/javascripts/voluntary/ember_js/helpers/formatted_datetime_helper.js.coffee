Ember.Handlebars.helper 'formatted-datetime', (datetime, options) ->
  new (Ember.Handlebars.SafeString)('<span title="' + moment(datetime).format('llll') + '">' + moment(datetime).fromNow() + '</span>')
