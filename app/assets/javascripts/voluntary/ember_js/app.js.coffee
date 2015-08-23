#= require_tree ./mixins
#= require_tree ./adapters
#= require_tree ./serializers
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./templates
#= require_tree ./routes
#= require_tree ./helpers
#= require_tree ./components
#= require ./router
#= require_self

Ember.TextField.reopen attributeBindings: [
  'data-autocomplete', 'data-append-autocomplete', 'data-append-to'
]

Volontariat.alert = (type, message) ->
  $('#alert_message').text message
  $('#alert').addClass "alert-#{type}"
  $("#alert").slideDown()
  
  setTimeout (->
    $("#alert").slideUp(400, ->
      $('#alert').removeClass "alert-#{type}"
    )
  ), 5000
  
Volontariat.reload_alert = (message) ->
  $('#reload_alert_message').text message
  $('#reload_alert').slideDown()
