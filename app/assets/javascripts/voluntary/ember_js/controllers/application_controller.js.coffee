Volontariat.ApplicationController = Ember.Controller.extend(Volontariat.HasCurrentUser,
 
  actions:
    
    signOut: ->
      $.ajax('/users/sign_out', type: 'DELETE').done((data) =>
        window.location.reload()
      ).fail((data) ->
        alert 'Signing out failed!'
      )
)