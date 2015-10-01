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
#= require ./lib
#= require ./router
#= require_self

Ember.TextField.reopen attributeBindings: [
  'data-autocomplete', 'data-append-autocomplete', 'data-append-to'
]