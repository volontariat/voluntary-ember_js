Volontariat.Router.map ->
  @resource 'users'
  
  # This route will be used to reload the current route by going to this route and then back to the current route
  @route 'no_data'
        
Volontariat.Router.reopen
  location: 'hash'