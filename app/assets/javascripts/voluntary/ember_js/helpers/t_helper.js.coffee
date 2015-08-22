Ember.Handlebars.helper 't', (key, no_html, options) ->
  keyArray = key.split('.')
  text = Volontariat.translations[keyArray.shift()]
  
  unless text == undefined || typeof(text) == 'string'
    $.each keyArray, (index, value) ->
      if text[value] == undefined
        text = undefined
        
        return false 
      
      text = text[value]
      
      return false if typeof(text) == 'string'
  
  if text == undefined
    if no_html == true
      "Missing translation: #{key}"
    else
      new (Ember.Handlebars.SafeString)('<span class="translation_missing" title="translation missing: ' + Volontariat.locale + '.' + key + '">' + key + '</span>')
  else
    text