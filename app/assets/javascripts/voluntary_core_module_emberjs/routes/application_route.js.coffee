VoluntaryOnEmberjs.ApplicationRoute = Ember.Route.extend
  model: ->
    currentUser = PreloadStore.get("currentUser")
    VoluntaryOnEmberjs.set('currentUser', currentUser) if currentUser
    
    # make sure we delete preloaded data
    PreloadStore.remove "currentUser"
    
  setupController: (controller) ->
    controller.set('currentUser', VoluntaryOnEmberjs.currentUser)
    
  renderTemplate: ->
    @render 'voluntary_core_module_emberjs/templates/application'