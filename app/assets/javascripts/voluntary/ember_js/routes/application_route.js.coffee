Volontariat.ApplicationRoute = Ember.Route.extend
  actions: 
    
    error: (error, transition) ->
      if error.status == 0
        alert 'Sorry, but we\'re having trouble connecting to the server. This problem is usually the result of a broken Internet connection. You can try refreshing this page.'
      else if error.status == 403
        alert 'Access denied!'
      else if error.status == 401
        alert 'Authentication required!'
      else if error.status == 404
        alert 'Page not found!'
      else
        alert "Something went wrong: HTTP status code #{error.status}!"
    
      if error.status == undefined
        return true
      else
        @transitionTo('index')
    
  renderTemplate: ->
    @render 'application'