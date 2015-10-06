Volontariat.FormattedDatetimeHelper = Ember.Helper.helper((params) ->
  datetime = params[0]
  new (Ember.Handlebars.SafeString)('<span title="' + moment(datetime).format('llll') + '">' + moment(datetime).fromNow() + '</span>')
)