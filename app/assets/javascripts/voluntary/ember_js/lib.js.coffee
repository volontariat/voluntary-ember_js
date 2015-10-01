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
  
Volontariat.t = (key) ->
  keyArray = key.split('.')
  text = Volontariat.translations[keyArray.shift()]
  
  unless text == undefined || typeof(text) == 'string'
    $.each keyArray, (index, value) ->
      if text[value] == undefined
        text = undefined
        
        return false 
      
      text = text[value]
      
      return false if typeof(text) == 'string'
      
  text
