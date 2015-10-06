Volontariat.NameWithApostropheHelper = Ember.Helper.helper((params) ->
  name = params[0]
  
  if name == undefined || name[name.length - 1] == undefined
    name
  else if name[name.length - 1].toLowerCase() == 's'
    "#{name}'"
  else
    "#{name}'s"
)