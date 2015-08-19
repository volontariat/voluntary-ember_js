Ember.Handlebars.helper 'name-with-apostrophe', (name, options) ->
  if name == undefined || name[name.length - 1] == undefined
    name
  else if name[name.length - 1].toLowerCase() == 's'
    "#{name}'"
  else
    "#{name}'s"
